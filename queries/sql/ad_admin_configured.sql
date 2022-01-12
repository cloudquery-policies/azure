WITH ad_admins_count AS ( SELECT ass.cq_id, count(*) AS admins_count
    FROM azure_sql_servers ass
        LEFT JOIN azure_sql_server_admins assa ON
            ass.cq_id = assa.server_cq_id WHERE assa.administrator_type = 'ActiveDirectory' GROUP BY ass.cq_id,
        assa.administrator_type
) SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, a.admins_count AS "ad_admins_count"
FROM azure_sql_servers s
    LEFT JOIN ad_admins_count a ON
        s.cq_id = a.cq_id
WHERE a.admins_count IS NULL
    OR a.admins_count = 0;
