WITH logging_enabled AS (
  SELECT DISTINCT s.cq_id
  FROM azure_search_services s
           LEFT JOIN azure_monitor_diagnostic_settings d ON s.id = d.resource_uri
           LEFT JOIN azure_monitor_diagnostic_setting_logs l
                     ON d.cq_id = l.diagnostic_setting_cq_id
  WHERE l.enabled = TRUE
    AND l.category = 'AuditEvent'
    AND (d.storage_account_id IS NOT NULL OR d.storage_account_id IS DISTINCT FROM '')
    AND retention_policy_enabled = TRUE
)
SELECT subscription_id, id
FROM azure_search_services s
         LEFT JOIN logging_enabled e ON s.cq_id = e.cq_id
WHERE e.cq_id IS NULL;
