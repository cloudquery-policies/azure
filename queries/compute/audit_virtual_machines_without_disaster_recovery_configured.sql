WITH asr_protect AS (
    SELECT source_id
    FROM azure_resources_links
    WHERE name LIKE 'ASR-Protect-%'
)
SELECT id
FROM
    azure_compute_virtual_machines vm
    LEFT OUTER JOIN asr_protect p
    ON LOWER(vm.id) = LOWER(p.source_id)
WHERE p.source_id IS NULL;
