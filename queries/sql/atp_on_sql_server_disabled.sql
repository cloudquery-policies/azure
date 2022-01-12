SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, d."name" AS database_name, p.state AS policy_state
FROM azure_sql_servers s
    LEFT JOIN azure_sql_databases d ON
        s.cq_id = d.server_cq_id
    LEFT JOIN azure_sql_database_db_threat_detection_policies p ON
        d.cq_id = p.database_cq_id
WHERE p.state != 'Enabled';
