WITH vaults_with_logging_enabled AS (SELECT DISTINCT v.cq_id
                                     FROM azure_keyvault_vaults v
                                              LEFT JOIN azure_monitor_diagnostic_settings s ON v.id = s.resource_uri
                                              LEFT JOIN azure_monitor_diagnostic_setting_logs l
                                                        ON s.cq_id = l.diagnostic_setting_cq_id
                                     WHERE l.enabled = TRUE
                                       AND l.category = 'AuditEvent'
                                       AND (s.storage_account_id IS NOT NULL OR s.storage_account_id IS DISTINCT FROM '')
                                       AND retention_policy_enabled = TRUE)
SELECT subscription_id, id
FROM azure_keyvault_vaults a
         LEFT JOIN vaults_with_logging_enabled e ON a.cq_id = e.cq_id
WHERE e.cq_id IS NULL;
