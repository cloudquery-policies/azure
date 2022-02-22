--vms created using old manager have type 'Microsoft.ClassicCompute/virtualMachines'
SELECT subscription_id, id
FROM azure_compute_virtual_machines
WHERE type IS DISTINCT FROM 'Microsoft.Compute/virtualMachines';