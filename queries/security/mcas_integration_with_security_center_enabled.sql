SELECT id, "name", enabled
FROM azure_security_settings ass
WHERE "name" = 'MCAS'
    AND enabled = TRUE;
