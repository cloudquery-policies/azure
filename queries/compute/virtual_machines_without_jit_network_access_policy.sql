WITH jit_vms AS (SELECT v.id AS vm_id
                 FROM azure_security_jit_network_access_policies p
                          JOIN azure_security_jit_network_access_policy_virtual_machines v
                               ON v.jit_network_access_policy_cq_id = p.cq_id
                 WHERE p.provisioning_state = 'Succeeded') -- todo check if this status returned in exactly this format
SELECT subscription_id, id, name
FROM azure_compute_virtual_machines vm
         LEFT JOIN jit_vms j ON vm.id = j.vm_id
WHERE j.vm_id = NULL;