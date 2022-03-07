SELECT id
FROM azure_web_apps
WHERE kind LIKE 'app%' AND https_only IS NOT TRUE;
