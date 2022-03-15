WITH vms_with_interfaces AS (SELECT subscription_id,
                                    id,
                                    JSONB_ARRAY_ELEMENTS(network_profile_network_interfaces) ->>
                                    'network_interface_id' AS network_interface_id
                             FROM azure_compute_virtual_machines vm)
SELECT v.subscription_id, v.id
FROM vms_with_interfaces v
         LEFT JOIN azure_network_interfaces i ON v.network_interface_id = i.id
         LEFT JOIN azure_network_interface_ip_configurations a
                   ON i.cq_id = a.interface_cq_id
WHERE a.subnet_id IS NULL;