SELECT subscription_id,
    id AS app_id, "name" AS app_name, identity_principal_id
FROM azure_web_apps
WHERE identity_principal_id IS NULL
    OR identity_principal_id = '';
