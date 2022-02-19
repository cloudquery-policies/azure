SELECT subscription_id, id
FROM azure_storage_accounts
WHERE network_rule_set_default_action IS DISTINCT FROM 'Deny';