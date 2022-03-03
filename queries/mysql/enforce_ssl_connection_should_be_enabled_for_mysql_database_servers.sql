SELECT id
FROM azure_mysql_servers
WHERE ssl_enforcement IS DISTINCT FROM 'Enabled';
