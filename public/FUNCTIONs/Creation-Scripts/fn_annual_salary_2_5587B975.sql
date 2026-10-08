CREATE OR REPLACE FUNCTION public.fn_annual_salary(p_monthly numeric, p_months integer DEFAULT 12)
 RETURNS numeric
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
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
END;
$function$;