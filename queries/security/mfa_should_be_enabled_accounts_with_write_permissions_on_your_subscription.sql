SELECT subscription_id
FROM azure_security_assessments
WHERE
  name = '57e98606-6b1e-6193-0e3d-fe621387c16b'
  AND code IS DISTINCT FROM 'NotApplicable'
  AND code IS DISTINCT FROM 'Healthy';
