SELECT id, "name", enabled
FROM azure_security_settings ass
WHERE "name" = 'WDATP'
    AND enabled = TRUE;
