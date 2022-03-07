SELECT s.subscription_id, d.id
FROM azure_sql_servers s
         LEFT JOIN azure_sql_databases d ON s.cq_id = d.server_cq_id
WHERE long_term_retention_policy IS NULL
   OR (long_term_retention_policy ->> 'monthlyRetention' = 'PT0S'
    AND long_term_retention_policy ->> 'weeklyRetention' = 'PT0S'
    AND long_term_retention_policy ->> 'yearlyRetention' = 'PT0S');