SELECT s.id
FROM
  azure_compute_virtual_machine_scale_sets s
  LEFT OUTER JOIN azure_security_assessments a
  ON a.name = 'e71020c2-860c-3235-cd39-04f3f8c936d2' AND starts_with(a.id, s.id || '/') 
WHERE
  a.name IS NULL
  OR (
    a.code IS DISTINCT FROM 'NotApplicable'
    AND a.code IS DISTINCT FROM 'Healthy'
  );
