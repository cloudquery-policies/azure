SELECT s.id
FROM
  azure_subscription_subscriptions s
  LEFT OUTER JOIN azure_monitor_log_profiles p
  ON s.id = '/subscriptions/' || p.subscription_id
WHERE
  categories IS NULL
  OR NOT categories @> '{"Write", "Action", "Delete"}';
