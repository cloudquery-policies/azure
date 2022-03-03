WITH valid_accounts AS (
  SELECT id
  FROM azure_cosmosdb_accounts, jsonb_array_elements(virtual_network_rules) AS rule
  WHERE rule ->> 'id' IS NOT NULL
)
SELECT a.id
FROM
  azure_cosmosdb_accounts a
  LEFT OUTER JOIN valid_accounts v
  ON a.id = v.id
WHERE
  v.id IS NULL;
