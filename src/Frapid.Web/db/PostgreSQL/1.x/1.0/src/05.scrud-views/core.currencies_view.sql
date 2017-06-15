
DROP VIEW IF EXISTS core.currencies_view;

CREATE VIEW core.currencies_view
AS
SELECT 
	core.currencies.currency_code AS currency_id,
	core.currencies.currency_name
FROM core.currencies
WHERE NOT core.currencies.deleted;
