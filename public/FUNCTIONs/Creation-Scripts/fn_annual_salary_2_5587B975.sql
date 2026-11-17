CREATE OR REPLACE FUNCTION public.fn_annual_salary(p_monthly numeric, p_months integer DEFAULT 12)
 RETURNS numeric
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
-- R6-B change
-- user4 makes a comment
-- user1 R8: salary rounding reviewed
-- user2 R8: negative salary check kept
BEGIN
    IF p_monthly IS NULL THEN
        -- user1 R8 round 4: NULL salary returns NULL
        RETURN NULL;
    END IF;
    IF p_monthly < 0 THEN
        RAISE EXCEPTION 'monthly salary cannot be negative: %', p_monthly;
    END IF;
    IF p_months <= 0 THEN
        RAISE EXCEPTION 'months must be positive: %', p_months;
    END IF;
    RETURN round(p_monthly * p_months, 2);
    -- user2 R8 round 2: result rounded to cents
END;
$function$; 