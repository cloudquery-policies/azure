SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, a."name" AS assesment_id
FROM azure_sql_servers s
    LEFT JOIN azure_sql_server_vulnerability_assessments a ON
        s.cq_id = a.server_cq_id
WHERE a.storage_container_path IS NULL OR a.storage_container_path = ''
