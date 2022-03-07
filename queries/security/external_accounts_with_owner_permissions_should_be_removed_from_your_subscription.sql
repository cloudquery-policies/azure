SELECT s.id
FROM
  azure_subscription_subscriptions s
  LEFT OUTER JOIN azure_security_assessments a
  ON
    s.id = '/subscriptions/' || a.subscription_id
    AND a.name = 'c3b6ae71-f1f0-31b4-e6c1-d5951285d03d'
    AND (a.code IS NOT DISTINCT FROM 'NotApplicable'
         OR a.code IS NOT DISTINCT FROM 'Healthy')
WHERE
  a.code IS NULL;
