CREATE OR REPLACE FUNCTION public.fn_full_name(p_first text, p_last text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$
    SELECT btrim(concat_ws(' ', nullif(btrim(p_first), ''), nullif(btrim(p_last), '')));
$function$;