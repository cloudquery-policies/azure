WITH value_check AS (
    SELECT aps.cq_id, apsc.value
    FROM azure_postgresql_servers aps
        LEFT JOIN azure_postgresql_server_configurations apsc ON
            aps.cq_id = apsc.server_cq_id
    WHERE apsc."name" = 'log_disconnections'
)
SELECT
    s.subscription_id,
    s.id AS server_id,
    s."name" AS server_name,
    'log_disconnections' AS "name",
    v.value
FROM azure_postgresql_servers s
    LEFT JOIN value_check v ON
        s.cq_id = v.cq_id
WHERE v.value IS NULL
    OR v.value != 'on';
