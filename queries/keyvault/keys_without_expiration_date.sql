SELECT akv.id AS vault_id, akv."name" AS vault_name, akvk.kid AS key_id
FROM azure_keyvault_vaults akv
    LEFT JOIN
        azure_keyvault_vault_keys akvk ON
            akv.cq_id = akvk.vault_cq_id
WHERE akvk.kid IS NULL
    OR enabled != TRUE
    OR expires IS NULL;
