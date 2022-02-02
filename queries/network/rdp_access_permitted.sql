SELECT *
FROM azure_nsg_rules
WHERE source_address_prefix in ('0.0.0.0', '0.0.0.0/0', 'any', 'internet', '<nw>/0', '/0', '*')
  AND (single_port = '3389'
    OR 3389 BETWEEN range_start AND range_end)
  AND protocol = 'Tcp'
  AND "access" = 'Allow'
  AND direction = 'Inbound'
