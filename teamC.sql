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
