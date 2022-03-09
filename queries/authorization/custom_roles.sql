SELECT mc.id
FROM azure_container_managed_clusters mc,
     azure_subscription_subscriptions sub
WHERE
  sub.subscription_id = mc.subscription_id
  AND enable_rbac IS NOT TRUE;
