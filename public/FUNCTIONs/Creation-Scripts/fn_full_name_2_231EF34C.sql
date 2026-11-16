CREATE OR REPLACE FUNCTION public.fn_full_name(p_first text, p_last text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$
-- R6-C change
-- user2 R8: full name trimming reviewed
-- user1 R8 round 2: empty names return NULL
    SELECT btrim(concat_ws(' ', nullif(btrim(p_first), ''), nullif(btrim(p_last), '')));
$function$; 