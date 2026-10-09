CREATE OR REPLACE FUNCTION public.fn_employee_code(p_department text, p_employee_id integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
    v_prefix text;
-- user3 makes a comment
BEGIN
    IF p_employee_id IS NULL THEN
        RETURN NULL;
    END IF;
    v_prefix := upper(substr(regexp_replace(coalesce(p_department, 'GEN'), '[^A-Za-z]', '', 'g'), 1, 3));
    IF v_prefix = '' THEN
        v_prefix := 'GEN';
    END IF;
    RETURN v_prefix || '-' || lpad(p_employee_id::text, 5, '0');
END;
$function$;