SELECT id
FROM azure_network_virtual_network_subnets
WHERE
  name = 'GatewaySubnet' AND network_security_group_id IS NOT NULL;
