CREATE OR REPLACE FUNCTION public.fn_is_working_day(p_date date)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE
AS $function$
-- R7-A change (top)
-- R7-C change
    -- ISO day of week: 6 = Saturday, 7 = Sunday
    SELECT CASE WHEN p_date IS NULL THEN NULL
                ELSE date_part('isodow', p_date) < 6
           END;
-- R7-B change (bottom)
$function$;