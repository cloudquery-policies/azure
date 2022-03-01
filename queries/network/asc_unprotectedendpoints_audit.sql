WITH network_security_groups AS (
	SELECT DISTINCT
		azure_network_security_group_security_rules.name AS security_group_name,
		azure_network_interfaces.id AS network_interface_id
	FROM
		azure_network_security_group_security_rules,
		azure_network_security_groups,
		azure_network_interfaces
	WHERE
		azure_network_security_groups.cq_id = azure_network_security_group_security_rules.security_group_cq_id
		AND azure_network_interfaces.resource_guid = azure_network_security_groups.resource_guid
		AND azure_network_security_group_security_rules.access = 'Allow'
		AND azure_network_security_group_security_rules.direction = 'Inbound'
		AND azure_network_security_group_security_rules.protocol IN ( 'TCP', '*' )
		AND (
			azure_network_security_group_security_rules.source_address_prefixes <@ARRAY [ '*', '0.0.0.0', '0.0.0.0/0', 'Internet', '<nw>/0', '/0' ]
			OR azure_network_security_group_security_rules.source_address_prefix IN ( '*', '0.0.0.0', '0.0.0.0/0', 'Internet', '<nw>/0', '/0' )
		)
	)
SELECT
	network_security_groups.security_group_name,
	machines.id,
	azure_subscription_subscriptions.display_name AS subscription_name,
	azure_subscription_subscriptions.id AS subscription_id
FROM
	azure_compute_virtual_machines machines,
	jsonb_array_elements ( machines.network_profile_network_interfaces ) AS interface
	LEFT JOIN network_security_groups ON interface @> json_build_object ( 'id', network_security_groups.network_interface_id ) :: jsonb
	JOIN azure_subscription_subscriptions ON azure_subscription_subscriptions.subscription_id = subscription_id
WHERE
	network_security_groups.security_group_name IS DISTINCT FROM NULL;