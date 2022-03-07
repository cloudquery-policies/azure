SELECT subscription_id
FROM azure_security_assessments
WHERE
  name = '94290b00-4d0c-d7b4-7cea-064a9554e681'
  AND code IS DISTINCT FROM 'NotApplicable'
  AND code IS DISTINCT FROM 'Healthy';
