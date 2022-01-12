SELECT subscription_id, id, email
FROM azure_security_contacts
WHERE email IS NOT NULL
    AND email != '';
