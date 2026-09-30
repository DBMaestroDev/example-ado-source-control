CREATE OR REPLACE FUNCTION public.fn_calc_shipping_cost(p_weight_kg numeric, p_distance_km numeric, p_express boolean DEFAULT false)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_base_rate NUMERIC := 5;   -- user1: fixed handling fee
    v_cost      NUMERIC;        -- user1: calculated shipping cost
BEGIN
    /* user1: Step 1 - base fee plus weight and distance charges */
    v_cost := v_base_rate + (p_weight_kg * 1.5) + (p_distance_km * 0.1);
    -- user1: Step 2 - express delivery doubles the cost
    IF p_express THEN
        v_cost := v_cost * 2;
/* user 1 says this is something else */
    END IF;
    /*
       user1: Step 3 - round to cents
       (added by user1 for merge testing)
    */
    RETURN ROUND(v_cost, 2);
END;
$function$;