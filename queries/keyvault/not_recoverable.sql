SELECT id, "name", enable_purge_protection, enable_soft_delete
FROM azure_keyvault_vaults
WHERE enable_soft_delete IS NOT TRUE
  OR enable_purge_protection IS NOT TRUE;
