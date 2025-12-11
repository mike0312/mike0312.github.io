## Example
Get-VIPermission -Entity (Get-Datacenter) -Principal Administrator
Retrieves the permissions of the Administrator user on the provided datacenters.

## Related Commands
VIPermission

|Get-VIPermission|
This cmdlet retrieves the permissions defined on the specified inventory objects.
|----------------|
|New-VIPermission|
|----------------|
This cmdlet creates new permissions on the specified inventory objects for the provided users and groups in the role.

Remove-VIPermission

This cmdlet removes the specified permissions.

Set-VIPermission

This cmdlet modifies the properties of the specified permissions.