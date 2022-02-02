SELECT *
FROM azure_nsg_rules
WHERE source_address_prefix in ('0.0.0.0', '0.0.0.0/0', 'any', 'internet', '<nw>/0', '/0', '*')
  AND protocol = 'Udp'
  AND "access" = 'Allow'
  AND direction = 'Inbound'
  AND (single_port = '22'
    OR 22 BETWEEN range_start AND range_end)
