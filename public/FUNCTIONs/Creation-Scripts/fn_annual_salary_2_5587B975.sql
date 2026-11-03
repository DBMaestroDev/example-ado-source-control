CREATE OR REPLACE FUNCTION public.fn_annual_salary(p_monthly numeric, p_months integer DEFAULT 12)
 RETURNS numeric
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
-- user4 makes a comment
DECLARE
    v_vergi_carpan        numeric := 1;
    v_hedef_prim          numeric;
    v_tko_kom_oran        numeric;
    v_max_hareket_id      numeric;
    v_onceki_hareket      numeric;
    v_hareket_id          numeric;
    v_ekbelge_no          numeric;
    v_bolge_yetkilimi     varchar(5);
BEGIN
    IF p_monthly IS NULL THEN
        RETURN NULL;
    END IF;
    IF p_monthly < 0 THEN
        RAISE EXCEPTION 'monthly salary cannot be negative: %', p_monthly;
    END IF;
    IF p_months <= 0 THEN
        RAISE EXCEPTION 'months must be positive: %', p_months;
    END IF;
    RETURN round(p_monthly * p_months, 2);
    -- feature-c: comment added near RETURN (different region)
END;
$function$;