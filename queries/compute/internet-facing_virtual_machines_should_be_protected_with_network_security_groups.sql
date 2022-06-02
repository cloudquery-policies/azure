SELECT vm.id
FROM
  azure_compute_virtual_machines vm
  LEFT OUTER JOIN azure_security_assessments a
  ON a.name = '483f12ed-ae23-447e-a2de-a67a10db4353' AND a.id like (vm.id || '/' || '%')
WHERE
  a.name IS NULL
  OR (
    a.code IS DISTINCT FROM 'NotApplicable'
    AND a.code IS DISTINCT FROM 'Healthy'
  );
