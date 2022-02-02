WITH owners_in_sub AS (SELECT a.subscription_id, COUNT(*) AS owners
                       FROM azure_authorization_role_assignments a
                                JOIN azure_authorization_role_definitions d ON a.role_definition_id = d.id
                       WHERE role_name = 'Owner'
                         AND role_type = 'BuiltInRole' -- todo check if it checks only role or permissions list as well
                       GROUP BY a.subscription_id)
SELECT *
FROM owners_in_sub
WHERE owners < 2;
