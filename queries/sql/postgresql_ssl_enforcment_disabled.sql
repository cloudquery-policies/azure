SELECT subscription_id, id AS server_id, "name", ssl_enforcement AS server_name
FROM azure_postgresql_servers aps
WHERE ssl_enforcement != 'Enabled'
    OR ssl_enforcement IS NULL;
