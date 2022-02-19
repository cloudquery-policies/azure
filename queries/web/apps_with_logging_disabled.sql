SELECT subscription_id,
       id
FROM azure_web_apps a
WHERE NOT (a.site_config -> 'httpLoggingEnabled')::bool
   OR NOT (a.site_config -> 'detailedErrorLoggingEnabled')::bool
   OR NOT (a.site_config -> 'requestTracingEnabled')::bool;