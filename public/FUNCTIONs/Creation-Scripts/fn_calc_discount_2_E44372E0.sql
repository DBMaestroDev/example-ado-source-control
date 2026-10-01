CREATE OR REPLACE FUNCTION public.fn_calc_discount(p_amount numeric, p_customer_tier text DEFAULT 'standard'::text)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_rate     NUMERIC;  -- discount rate in percent
    v_discount NUMERIC;  -- discount amount
BEGIN
    /*
       Step 1: pick the discount rate by customer tier
       standard = 0%, silver = 5%, gold = 10%
    */
    v_rate := CASE lower(p_customer_tier)
                  WHEN 'gold'   THEN 10
                  WHEN 'silver' THEN 5
                  ELSE 0
              END;

    -- Step 2: calculate the discount amount
    v_discount := p_amount * v_rate / 100;

    /*
       Step 3: round to cents
       user2: rounding uses half-up (ROUND on numeric)
    */
    RETURN ROUND(v_discount, 2);
END;
$function$;