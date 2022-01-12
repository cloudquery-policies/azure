SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, assdbap.state AS auditing_state
FROM azure_sql_servers s
    LEFT JOIN azure_sql_server_db_blob_auditing_policies assdbap ON
        s.cq_id = assdbap.server_cq_id
WHERE assdbap.state != 'Enabled';
