SELECT
	sg.id,
	sub.display_name AS subscription_name,
	sub.id AS subscription_is
FROM
	azure_network_security_groups AS sg
	JOIN azure_subscription_subscriptions AS sub ON sub.subscription_id = sg.subscription_id
	LEFT JOIN azure_network_virtual_network_subnets AS subnet ON subnet.network_security_group_id = sg.id
WHERE
	subnet.id IS NULL;
