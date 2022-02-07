SELECT id
FROM azure_postgresql_servers
WHERE ssl_enforcement IS DISTINCT FROM 'Enabled';
