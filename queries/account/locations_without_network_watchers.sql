SELECT l.subscription_id, l.id
FROM azure_account_locations l
         LEFT JOIN azure_network_watchers anw ON l.name = anw.location
WHERE anw.cq_id IS NULL;