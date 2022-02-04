WITH protected_instances AS (SELECT s.id AS instance_id
                             FROM azure_sql_managed_instances s
                                      LEFT JOIN azure_sql_managed_instance_encryption_protectors ep
                                                ON s.cq_id = ep.managed_instance_cq_id
                             WHERE ep.server_key_type = 'AzureKeyVault'
                               AND ep.uri IS NOT NULL)
SELECT i.subscription_id, i.id AS instance_id, i."name" AS instance_name
FROM azure_sql_managed_instances i
         LEFT JOIN protected_instances p ON p.instance_id = i.id
WHERE p.instance_id IS NULL;