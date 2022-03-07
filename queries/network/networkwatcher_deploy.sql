SELECT
	azure_network_virtual_networks.id,
	azure_network_virtual_networks.location,
	sub.display_name AS subscription_name,
	sub.id AS subscription_id
FROM
	azure_network_virtual_networks
	LEFT JOIN azure_network_watchers ON azure_network_virtual_networks.location = azure_network_watchers.location
	JOIN azure_subscription_subscriptions sub ON sub.subscription_id = azure_network_virtual_networks.subscription_id
WHERE
	azure_network_watchers.location IS NULL
	OR LOWER ( split_part( azure_network_watchers.id, '/', 5 ) ) != 'networkwatcherrg';