SELECT subscription_id, id, email
FROM azure_security_contacts
WHERE email IS NOT NULL
    AND email != '' AND alert_notifications = 'On';
