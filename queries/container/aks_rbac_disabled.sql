SELECT id, "name", enable_rbac
FROM azure_container_managed_clusters acmc
WHERE enable_rbac != TRUE;
