CREATE TABLE public.sc_merge_probe (
    id integer NOT NULL,
    note character varying(50),
    status character varying(20) DEFAULT 'new'::character varying
);


ALTER TABLE ONLY public.sc_merge_probe
    ADD CONSTRAINT sc_merge_probe_pkey PRIMARY KEY (id);