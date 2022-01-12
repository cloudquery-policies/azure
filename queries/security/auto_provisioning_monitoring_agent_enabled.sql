SELECT id, "name"
FROM azure_security_auto_provisioning_settings asaps
WHERE "name" = 'default'
    AND auto_provision = 'On';
