SELECT id, "name", enable_purge_protection
FROM azure_keyvault_vaults akv
WHERE enable_soft_delete != TRUE
    OR enable_purge_protection != TRUE;
