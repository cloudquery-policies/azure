SELECT subscription_id, id AS disk_id, "name" AS disk_name, encryption_type
FROM azure_compute_disks acd3
WHERE disk_state = 'Unattached'
    AND encryption_type NOT LIKE '%CustomerKey%';
