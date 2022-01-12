SELECT
    s.subscription_id,
    asd.id AS database_id,
    asd.transparent_data_encryption -> 'properties' ->> 'status' AS encryption_status
FROM azure_sql_servers s
    LEFT JOIN azure_sql_databases asd ON
        s.cq_id = asd.server_cq_id
WHERE asd.transparent_data_encryption -> 'properties' ->> 'status' != 'Enabled';
