SELECT subscription_id, id, name
FROM azure_compute_virtual_machines WHERE storage_profile -> 'osDisk' -> 'managedDisk' -> 'id' IS NULL;
