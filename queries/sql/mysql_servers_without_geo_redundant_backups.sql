SELECT subscription_id, id
FROM azure_mysql_servers
WHERE storage_profile_geo_redundant_backup IS DISTINCT FROM 'Enabled';