CREATE TABLE public.sc_merge_probe (
    id integer NOT NULL,
    note character varying(50),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE ONLY public.sc_merge_probe
    ADD CONSTRAINT sc_merge_probe_pkey PRIMARY KEY (id);