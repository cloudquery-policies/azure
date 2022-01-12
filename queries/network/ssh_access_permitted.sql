SELECT *
FROM azure_nsg_rules
WHERE (source_address_prefix = '*'
    OR source_address_prefix = '0.0.0.0'
    OR source_address_prefix = '<nw>/0'
    OR source_address_prefix = '/0'
    OR source_address_prefix = 'internet'
    OR source_address_prefix = 'any')
    AND protocol = 'Udp'
    AND "access" = 'Allow'
    AND direction = 'Inbound'
    AND (single_port = '22'
        OR 22 BETWEEN range_start AND range_end)
