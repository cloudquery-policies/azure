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
    AND ((single_port = '53'
        OR 53 BETWEEN range_start AND range_end)
        OR (single_port = '123'
            OR 123 BETWEEN range_start AND range_end)
        OR (single_port = '161'
            OR 161 BETWEEN range_start AND range_end)
        OR (single_port = '389'
            OR 389 BETWEEN range_start AND range_end));
