WITH accounts_with_logging_enabled AS (SELECT DISTINCT d.cq_id
    FROM azure_datalake_analytics_accounts d
        LEFT JOIN azure_monitor_diagnostic_settings s ON d.id = s.resource_uri
        LEFT JOIN azure_monitor_diagnostic_setting_logs l
            ON s.cq_id = l.diagnostic_setting_cq_id
    WHERE l.enabled = TRUE)
SELECT subscription_id, id
FROM azure_datalake_analytics_accounts a
    LEFT JOIN accounts_with_logging_enabled e ON a.cq_id = e.cq_id
WHERE e.cq_id IS NULL;