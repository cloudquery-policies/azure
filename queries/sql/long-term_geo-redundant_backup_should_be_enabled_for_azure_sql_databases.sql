SELECT id
FROM azure_sql_databases
WHERE
  backup_long_term_retention_policy -> 'properties' ->> 'weeklyRetention' IS NOT DISTINCT FROM 'PT0S'
  AND backup_long_term_retention_policy -> 'properties' ->> 'monthlyRetention' IS NOT DISTINCT FROM 'PT0S'
  AND backup_long_term_retention_policy -> 'properties' ->> 'yearlyRetention' IS NOT DISTINCT FROM 'PT0S';
