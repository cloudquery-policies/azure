SELECT s.subscription_id, s.id AS server_id, s."name" AS server_name, p.kind AS protector_kind
FROM azure_sql_servers s
         LEFT JOIN azure_sql_server_encryption_protectors p ON
    s.cq_id = p.server_cq_id
WHERE p.kind != 'azurekeyvault'
   OR p.server_key_type IS DISTINCT FROM 'AzureKeyVault'
   OR uri IS NULL;
