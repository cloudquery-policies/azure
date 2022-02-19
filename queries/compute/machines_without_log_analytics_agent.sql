WITH secured_vms AS (SELECT virtual_machine_cq_id
                     FROM azure_compute_virtual_machine_resources
                     WHERE extension_type IN ('MicrosoftMonitoringAgent', 'OmsAgentForLinux')
                       AND publisher = 'Microsoft.EnterpriseCloud.Monitoring'
                       AND provisioning_state = 'Succeeded'
                       AND settings ->> 'workspaceId' IS NOT NULL)
SELECT vms.subscription_id, vms.id, vms.name
FROM azure_compute_virtual_machines vms
         LEFT JOIN secured_vms s ON vms.cq_id = s.virtual_machine_cq_id
WHERE s.virtual_machine_cq_id IS NULL;