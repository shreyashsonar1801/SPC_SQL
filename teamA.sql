#CREATE SCRIPT FOR TRAINER

"""SQL

-- Table: public.trainers

-- DROP TABLE IF EXISTS public.trainers;

CREATE TABLE IF NOT EXISTS public.trainers
(
    trainer_id integer NOT NULL DEFAULT nextval('trainers_trainer_id_seq'::regclass),
    trainer_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(15) COLLATE pg_catalog."default",
    address text COLLATE pg_catalog."default",
    experience_years integer,
    qualification character varying(100) COLLATE pg_catalog."default",
    joining_date date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone,
    domain_id integer,
    salary integer,
    status boolean,
    gender character(1) COLLATE pg_catalog."default",
    CONSTRAINT trainers_pkey PRIMARY KEY (trainer_id),
    CONSTRAINT trainers_email_key UNIQUE (email),
    CONSTRAINT fk_trainer_domain FOREIGN KEY (domain_id)
        REFERENCES public.domains (domain_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT phone_check CHECK (phone::text ~ '^\d{10}$'::text),
    CONSTRAINT gender_check CHECK (gender = ANY (ARRAY['M'::bpchar, 'F'::bpchar, 'O'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trainers
    OWNER to postgres;
"""
