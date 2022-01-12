SELECT subscription_id,
    id AS app_id, "name" AS app_name, identity_principal_id, p.user_name
FROM azure_web_apps a
    LEFT JOIN azure_web_app_publishing_profiles p ON
        a.cq_id = p.app_cq_id
WHERE p.user_name NOT LIKE concat('%', a."name", '%')
