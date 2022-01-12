SELECT
    aps.subscription_id,
    aps.id AS server_id,
    aps."name" AS server_name,
    apsfr."name" AS rule_name,
    apsfr.start_ip_address,
    apsfr.end_ip_address
FROM azure_postgresql_servers aps
    LEFT JOIN azure_postgresql_server_firewall_rules apsfr ON
        aps.cq_id = apsfr.server_cq_id
WHERE apsfr."name" = 'AllowAllAzureIps'
    OR (apsfr.start_ip_address = '0.0.0.0'
        AND apsfr.end_ip_address = '0.0.0.0')
