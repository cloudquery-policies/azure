WITH namespaces_with_logging_enabled AS (SELECT DISTINCT n.cq_id
     FROM azure_eventhub_namespaces n
          LEFT JOIN azure_monitor_diagnostic_settings s ON n.id = s.resource_uri
          LEFT JOIN azure_monitor_diagnostic_setting_logs l
                ON s.cq_id = l.diagnostic_setting_cq_id
     WHERE l.enabled = TRUE)
SELECT subscription_id, id
FROM azure_eventhub_namespaces a
     LEFT JOIN namespaces_with_logging_enabled e ON a.cq_id = e.cq_id
WHERE e.cq_id IS NULL;
