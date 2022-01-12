SELECT ass.id AS server_id, ass."name" AS server_name
FROM azure_sql_servers ass
    LEFT JOIN
        azure_sql_server_firewall_rules assfr ON
            ass.cq_id = assfr.server_cq_id
WHERE assfr.start_ip_address = '0.0.0.0'
    OR ( assfr.start_ip_address = '255.255.255.255'
        AND assfr.end_ip_address = '0.0.0.0' );
