SELECT id
FROM azure_web_apps
WHERE kind LIKE 'functionapp%' AND https_only IS NOT TRUE;
