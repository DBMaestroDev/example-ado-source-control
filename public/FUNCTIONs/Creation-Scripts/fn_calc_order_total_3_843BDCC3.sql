CREATE OR REPLACE FUNCTION public.fn_calc_order_total(p_subtotal numeric, p_discount numeric DEFAULT 0, p_tax_rate numeric DEFAULT 17)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_after_discount NUMERIC;  -- subtotal after discount
    v_total          NUMERIC;  -- final amount
BEGIN
    /* Step 1: apply discount */
    v_after_discount := p_subtotal * (1 - p_discount / 100);
    -- Step 2: apply tax
    v_total := v_after_discount * (1 + p_tax_rate / 100);
    /*
       Step 3: round to 2 decimals
       (multi-line comment to test merge of block comments)
    */
    RETURN ROUND(v_total, 2);
END;
$function$;