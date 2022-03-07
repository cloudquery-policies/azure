WITH installed AS (
	SELECT
		DISTINCT virtual_machine_id
	FROM
		azure_compute_virtual_machine_resources
	WHERE
		publisher = 'Microsoft.EnterpriseCloud.Monitoring'
		AND extension_type IN ( 'MicrosoftMonitoringAgent', 'OmsAgentForLinux' )
		AND provisioning_state = 'Succeeded'
		AND settings ->> 'workspaceId' IS NOT NULL
)
SELECT
	azure_compute_virtual_machines.vm_id AS resource,
	azure_subscription_subscriptions.display_name AS subscription_name,
	azure_subscription_subscriptions.ID AS subscription_id
FROM
	azure_compute_virtual_machines
	LEFT JOIN installed ON azure_compute_virtual_machines.ID = installed.virtual_machine_id,
	azure_subscription_subscriptions
WHERE
	azure_subscription_subscriptions.subscription_id = azure_compute_virtual_machines.subscription_id
	AND azure_compute_virtual_machines.storage_profile -> 'osDisk' ->> 'osType' = 'Windows'
	AND installed.virtual_machine_id IS NULL;