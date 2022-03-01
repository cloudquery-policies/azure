SELECT subscription_id
FROM azure_security_assessments
WHERE
  name = '151e82c5-5341-a74b-1eb0-bc38d2c84bb5'
  AND code IS DISTINCT FROM 'NotApplicable'
  AND code IS DISTINCT FROM 'Healthy';
