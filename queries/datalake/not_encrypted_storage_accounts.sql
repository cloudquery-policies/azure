SELECT
	b.account_id AS resource,
	sub.display_name AS subscription_name,
	sub.id AS subscription_id 
FROM
	azure_datalake_storage_accounts AS b,
	azure_subscription_subscriptions AS sub 
WHERE
	sub.subscription_id = b.subscription_id 
	AND encryption_state IS DISTINCT FROM 'Enabled';
