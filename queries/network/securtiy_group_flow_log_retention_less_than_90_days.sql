SELECT ansg."name" AS nsg_name, ansg.id AS nsg_name, ansgfl.retention_policy_enabled, ansgfl.retention_policy_days
FROM azure_network_security_groups ansg
    LEFT JOIN azure_network_security_group_flow_logs ansgfl ON
        ansg.cq_id = ansgfl.security_group_cq_id
WHERE ansgfl.retention_policy_enabled != TRUE
    OR ansgfl.retention_policy_enabled IS NULL
    OR ansgfl.retention_policy_days < 90
    OR ansgfl.retention_policy_days IS NULL;
