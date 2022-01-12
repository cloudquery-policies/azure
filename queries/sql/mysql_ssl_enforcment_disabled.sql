SELECT subscription_id, id AS server_id, "name" AS server_name, ssl_enforcement
FROM azure_mysql_servers ams
WHERE ssl_enforcement != 'Enabled'
    OR ssl_enforcement IS NULL;
