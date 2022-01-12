SELECT v.id AS vm_id, v.name AS vm_name, d.id AS disk_id, d.name AS disk_name, d.encryption_type
FROM azure_compute_virtual_machines v
    JOIN azure_compute_disks d ON
        LOWER(v.id) = LOWER(d.managed_by)
        AND encryption_type NOT LIKE '%CustomerKey%';
