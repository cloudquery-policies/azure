SELECT id, "name", pricing_properties_tier AS tier
FROM azure_security_pricings asp
WHERE "name" = 'AppServices'
    AND pricing_properties_tier = 'Standard';
