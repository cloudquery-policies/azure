SELECT subscription_id,
    id AS app_id, "name" AS app_name, client_cert_enabled
FROM azure_web_apps
WHERE kind LIKE 'app%'
    AND client_cert_enabled IS NOT TRUE;
