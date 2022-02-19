WITH secured_accounts AS (SELECT a.cq_id
                          FROM azure_storage_accounts a
                                   LEFT JOIN azure_storage_account_network_rule_set_virtual_network_rules r
                                             ON a.cq_id = r.account_cq_id
                                   LEFT JOIN azure_network_virtual_network_subnets s
                                             ON r.virtual_network_resource_id = s.id
                          WHERE a.network_rule_set_default_action = 'Deny'
                            AND r.virtual_network_resource_id IS NOT NULL
                            AND s.provisioning_state = 'Succeeded')
SELECT subscription_id, id
FROM azure_storage_accounts a
         LEFT JOIN secured_accounts s ON a.cq_id = s.cq_id
WHERE s.cq_id IS NULL;