WITH vm_disks AS (
    SELECT
        subscription_id,
        id,
        name,
        jsonb_array_elements( instance_view -> 'disks') AS disk
    FROM azure_compute_virtual_machines
),
disk_encrytpions AS (
    SELECT
        subscription_id,
        id,
        name,
        disk -> 'name' AS disk_name,
        (disk -> 'encryptionSettings' -> 0 ->> 'enabled')::BOOLEAN AS encryption_enabled
    FROM vm_disks
)
SELECT *
FROM disk_encrytpions
WHERE encryption_enabled IS NULL
    OR encryption_enabled != TRUE;
