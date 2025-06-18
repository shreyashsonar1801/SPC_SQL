 FUNCTION: public.crud_get_transactions()

-- DROP FUNCTION IF EXISTS public.crud_get_transactions();

CREATE OR REPLACE FUNCTION public.crud_get_transactions(
	)
    RETURNS TABLE(transaction_id integer, transaction_date date, amount integer, transaction_mode character varying, upi_id character varying, note character varying, candidate_id integer, created_at timestamp without time zone, updated_at timestamp without time zone) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        t.transaction_id,
        t.transaction_date,
        t.amount,
        t.transaction_mode,
        t.upi_id,
        t.note,
        t.candidate_id,
        t.created_at,
        t.updated_at
    FROM public.transactions t;
END;
$BODY$;



-- FUNCTION: public.get_all_fees()

-- DROP FUNCTION IF EXISTS public.get_all_fees();

CREATE OR REPLACE FUNCTION public.get_all_fees(
	)
    RETURNS TABLE(fees_id integer, amount integer, due_date date, status character varying, candidate_id integer) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        f.fees_id,
        f.amount,
        f.due_date,
        f.status,
        f.candidate_id
    FROM public.fees f;
END;
$BODY$;

ALTER FUNCTION public.get_all_fees()
    OWNER TO postgres;




-- FUNCTION: public.crud_get_batches()

-- DROP FUNCTION IF EXISTS public.crud_get_batches();

CREATE OR REPLACE FUNCTION public.crud_get_batches(
	)
    RETURNS TABLE(batch_id integer, batch_name character varying, start_date date, end_date date, domain_id integer) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        b.batch_id,
        b.batch_name,
        b.start_date,
        b.end_date,
        b.domain_id
    FROM batches b;
END;
$BODY$;

ALTER FUNCTION public.crud_get_batches()
    OWNER TO postgres;



-- FUNCTION: public.crud_get_batch_trainers()

-- DROP FUNCTION IF EXISTS public.crud_get_batch_trainers();

CREATE OR REPLACE FUNCTION public.crud_get_batch_trainers(
	)
    RETURNS TABLE(batch_trainer_id integer, batch_id integer, trainer_id integer) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT bt.batch_trainer_id, bt.batch_id, bt.trainer_id
    FROM public.batch_trainers AS bt;
END;
$BODY$;

ALTER FUNCTION public.crud_get_batch_trainers()
    OWNER TO postgres;



