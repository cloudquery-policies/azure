SELECT s.id
FROM
  azure_subscription_subscriptions s
  LEFT OUTER JOIN azure_security_assessments a
  ON
    s.id = '/subscriptions/' || a.subscription_id
    AND a.name = 'e52064aa-6853-e252-a11e-dffc675689c2'
    AND (a.code IS NOT DISTINCT FROM 'NotApplicable'
         OR a.code IS NOT DISTINCT FROM 'Healthy')
WHERE
  a.code IS NULL;
