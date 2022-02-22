WITH secured_servers AS (SELECT s.cq_id
                         FROM azure_sql_servers s
                                  LEFT JOIN azure_sql_server_virtual_network_rules r
                                            ON s.cq_id = r.server_cq_id
                                  LEFT JOIN azure_network_virtual_network_subnets sb
                                            ON r.subnet_id = sb.id
                         WHERE r.subnet_id IS NOT NULL
                           AND sb.provisioning_state = 'Succeeded')
SELECT subscription_id, id
FROM azure_sql_servers s
         LEFT JOIN secured_servers ss ON s.cq_id = ss.cq_id
WHERE ss.cq_id IS NULL;