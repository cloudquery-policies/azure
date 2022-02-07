SELECT id
FROM azure_web_apps
WHERE kind LIKE '%api' AND https_only IS NOT TRUE;
