SELECT id
FROM azure_web_apps
WHERE
  kind LIKE '%api'
  AND (site_config -> 'minTlsVersion' IS NULL
       OR site_config -> 'minTlsVersion' != '1.2');
