SELECT subscription_id,
       id
FROM azure_web_apps a
WHERE NOT (a.site_config -> 'httpLoggingEnabled')::text::bool
   OR NOT (a.site_config -> 'detailedErrorLoggingEnabled')::text::bool
   OR NOT (a.site_config -> 'requestTracingEnabled')::text::bool;