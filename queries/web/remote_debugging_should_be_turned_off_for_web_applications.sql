SELECT subscription_id, id
FROM azure_web_apps
WHERE kind LIKE 'app%'
    AND site_config ->> 'remoteDebuggingEnabled' = 'true';
