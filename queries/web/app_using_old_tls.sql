SELECT subscription_id,
    id AS app_id, "name" AS app_name, site_config -> 'minTlsVersion' AS min_tls_version
FROM azure_web_apps
WHERE site_config -> 'minTlsVersion' IS NULL
    OR site_config -> 'minTlsVersion' != '1.2';
