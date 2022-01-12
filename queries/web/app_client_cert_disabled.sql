SELECT subscription_id,
    id AS app_id, "name" AS app_name, client_cert_enabled
FROM azure_web_apps
WHERE client_cert_enabled IS NULL
    OR client_cert_enabled != TRUE;
