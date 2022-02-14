SELECT subscription_id, id
FROM azure_web_apps
WHERE site_config -> 'cors' -> 'allowedOrigins' @> '["*"]'
    AND kind LIKE 'app%';
