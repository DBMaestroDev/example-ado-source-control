CREATE OR REPLACE FUNCTION public.fn_calc_order_total(p_subtotal numeric, p_discount numeric DEFAULT 0, p_tax_rate numeric DEFAULT 17)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_after_discount NUMERIC;  -- net amount after customer discount
    v_total          NUMERIC;  -- amount to be charged
BEGIN
    /* Step 1: reduce subtotal by customer discount */
    v_after_discount := p_subtotal * (1 - p_discount / 100);
    -- Step 2: add VAT on the discounted amount
    v_total := v_after_discount * (1 + p_tax_rate / 100);
    /*
       Step 3: round to cents
       (block comment changed on this branch for merge testing)
       this is a new line
       this is another line by user1
    */
    RETURN ROUND(v_total, 2);
    /*
       User 1 makes a comment
       (block comment changed on this branch for merge testing)
       this is a new line
       this is another line by user1
    */
END;
$function$;