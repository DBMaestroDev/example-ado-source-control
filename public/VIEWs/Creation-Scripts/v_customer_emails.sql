CREATE VIEW public.v_customer_emails AS
 SELECT id,
    name,
    email
   FROM customers
  WHERE email IS NOT NULL;