Get-VM | ForEach-Object {
    $vm = $_
    Get-VIPermission -Entity $vm |
    Where-Object { $_.Principal -eq "testuser" } |
    Select-Object @{N="VM";E={$vm.Name}},
                  Principal,
                  Role,
                  Propagate,
                  IsGroup
}
Export-Csv -Path "vm_permissions.csv" -NoTypeInformation