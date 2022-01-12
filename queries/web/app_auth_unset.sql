SELECT awa.subscription_id,
    awa.id AS app_id, awa."name" AS app_name, awaas.enabled AS auth_enabled
FROM azure_web_apps awa
    LEFT JOIN azure_web_app_auth_settings awaas ON
        awa.cq_id = awaas.app_cq_id
WHERE awaas.enabled IS NULL
    OR awaas.enabled != TRUE;
