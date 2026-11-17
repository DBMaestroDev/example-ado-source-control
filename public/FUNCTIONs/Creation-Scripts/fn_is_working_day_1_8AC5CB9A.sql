CREATE OR REPLACE FUNCTION public.fn_is_working_day(p_date date)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE
AS $function$
-- user2 R8 round 3: ISO weekday numbering
    -- ISO day of week: 6 = Saturday, 7 = Sunday
    SELECT CASE WHEN p_date IS NULL THEN NULL
                ELSE date_part('isodow', p_date) < 6
           END;
$function$;