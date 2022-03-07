SELECT subscription_id, id
FROM azure_mariadb_servers
WHERE geo_redundant_backup IS DISTINCT FROM 'Enabled';