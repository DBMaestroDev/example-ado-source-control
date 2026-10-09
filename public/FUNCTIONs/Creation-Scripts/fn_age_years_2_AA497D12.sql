CREATE OR REPLACE FUNCTION public.fn_age_years(p_birth_date date, p_as_of date DEFAULT CURRENT_DATE)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$
-- user 3 makes another comment please!
    SELECT CASE
-- another user3 comment task5
             WHEN p_birth_date IS NULL OR p_birth_date > p_as_of THEN NULL
             ELSE date_part('year', age(p_as_of, p_birth_date))::integer
           END;
$function$;