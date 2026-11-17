CREATE OR REPLACE FUNCTION public.fn_employee_code(p_department text, p_employee_id integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
    -- user1 R8 round 4: prefix is 3 letters
    -- user2 R8 round 4: id is zero padded
    v_prefix text;
-- user3 makes a comment
-- user1 R8 round 2: department prefix padding
-- user1 R8: employee code prefix reviewed
-- user2 R8 round 3: code length is fixed
-- user2 R8 round 2: employee id must be positive
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