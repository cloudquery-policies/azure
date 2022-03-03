WITH valid_namespaces AS (
  SELECT id
  FROM azure_eventhub_namespaces, jsonb_array_elements(network_rule_set -> 'properties' -> 'virtualNetworkRules') AS rule
  WHERE rule -> 'subnet' ->> 'id' IS NOT NULL
)
SELECT n.id
FROM
  azure_eventhub_namespaces n
  LEFT OUTER JOIN valid_namespaces v
  ON n.id = v.id
WHERE
  v.id IS NULL;
