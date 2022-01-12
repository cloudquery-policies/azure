SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, assdbap.retention_days AS auditing_retention_days
FROM azure_sql_servers s
    LEFT JOIN azure_sql_server_db_blob_auditing_policies assdbap ON
        s.cq_id = assdbap.server_cq_id
WHERE assdbap.retention_days < 90;
