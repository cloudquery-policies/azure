WITH sets_with_logs AS (
    SELECT virtual_machine_scale_set_cq_id
    FROM azure_compute_virtual_machine_scale_set_extensions
    WHERE (publisher = 'Microsoft.Azure.Diagnostics' AND
           extension_type = 'IaaSDiagnostics')
       OR (publisher IN ('Microsoft.OSTCExtensions', 'Microsoft.Azure.Diagnostics') AND
           extension_type = 'LinuxDiagnostic'))
SELECT id, "name" AS set_name
FROM azure_compute_virtual_machine_scale_sets s
         LEFT JOIN sets_with_logs ss ON s.cq_id = ss.virtual_machine_scale_set_cq_id
WHERE ss.virtual_machine_scale_set_cq_id IS NULL;