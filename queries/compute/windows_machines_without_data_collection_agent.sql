WITH secured_vms AS (SELECT virtual_machine_cq_id
                     FROM azure_compute_virtual_machine_resources
                     WHERE extension_type = 'DependencyAgentWindows'
                       AND publisher = 'Microsoft.Azure.Monitoring.DependencyAgent'
                       AND provisioning_state = 'Succeeded')
SELECT vms.subscription_id, vms.id, vms.name
FROM azure_compute_virtual_machines vms
         LEFT JOIN secured_vms s ON vms.cq_id = s.virtual_machine_cq_id
WHERE vms.storage_profile -> 'osDisk' ->> 'osType' = 'Windows'
  and s.virtual_machine_cq_id IS NULL;