SELECT subscription_id,
    id AS app_id, "name" AS app_name, https_only
FROM azure_web_apps
WHERE https_only IS NULL
    OR https_only != TRUE;
