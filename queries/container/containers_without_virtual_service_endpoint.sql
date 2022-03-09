SELECT r.subscription_id, r.id as registry_id
FROM azure_container_registries r
         LEFT JOIN azure_container_registry_network_rule_set_virtual_network_rules acrnrsvnr
                   ON r.cq_id = acrnrsvnr.registry_cq_id
         LEFT JOIN azure_network_virtual_network_subnets anvns ON acrnrsvnr.virtual_network_id = anvns.id
WHERE r.network_rule_set_default_action IS DISTINCT FROM 'Deny'
   OR acrnrsvnr.virtual_network_id IS NULL
   OR anvns.cq_id IS NULL;
