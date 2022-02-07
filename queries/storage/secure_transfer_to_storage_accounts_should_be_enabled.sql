SELECT id
FROM azure_storage_accounts
WHERE enable_https_traffic_only IS NOT TRUE;
