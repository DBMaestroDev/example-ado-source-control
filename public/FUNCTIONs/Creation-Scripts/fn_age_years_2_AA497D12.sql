CREATE OR REPLACE FUNCTION public.fn_age_years(p_birth_date date, p_as_of date DEFAULT CURRENT_DATE)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE
AS $function$
-- R6-A change
-- user 3 makes another comment please!
    SELECT CASE
-- another user3 comment task5
-- user4 makes a conflict line
-- user2 R8: null birth date handled
             WHEN p_birth_date IS NULL OR p_birth_date > p_as_of THEN NULL
             ELSE date_part('year', age(p_as_of, p_birth_date))::integer
           END;
-- user2 R8 round 3: negative ages return NULL
$function$; 