SELECT akv.id AS vault_id, akv."name" AS vault_name, akvs.id AS key_id
FROM azure_keyvault_vaults akv
    LEFT JOIN
        azure_keyvault_vault_secrets akvs ON
            akv.cq_id = akvs.vault_cq_id
WHERE enabled != TRUE
    OR expires IS NULL;
