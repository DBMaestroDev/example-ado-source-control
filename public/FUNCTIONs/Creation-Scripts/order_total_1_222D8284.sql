CREATE OR REPLACE FUNCTION public.order_total(p_customer integer)
 RETURNS numeric
 LANGUAGE sql
AS $function$ SELECT coalesce(sum(amount),0) FROM public.orders WHERE customer_id = p_customer $function$;