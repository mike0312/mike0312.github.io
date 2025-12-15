# PowerCLI Script to List VMs from a Folder and Their Permissions

# Prompt for vCenter server
$vcServer = Read-Host "Enter vCenter Server"

# Connect to vCenter
$credential = Get-Credential
Connect-VIServer -Server $vcServer -Credential $credential

# Prompt for folder name
$folderName = Read-Host "Enter Folder Name"

# Get the folder
$folder = Get-Folder -Name $folderName

# Get VMs in the folder
$vms = Get-VM -Location $folder

# Loop through each VM and get permissions
foreach ($vm in $vms) {
    Write-Host "VM: $($vm.Name)" -ForegroundColor Green
    $permissions = Get-VIPermission -Entity $vm
    if ($permissions) {
        foreach ($perm in $permissions) {
            Write-Host "  Principal: $($perm.Principal)" -ForegroundColor Yellow
            Write-Host "  Role: $($perm.Role)" -ForegroundColor Cyan
            Write-Host "  Is Group: $($perm.IsGroup)" -ForegroundColor Magenta
            Write-Host "  Propagate: $($perm.Propagate)" -ForegroundColor White
            Write-Host ""
        }
    } else {
        Write-Host "  No direct permissions found." -ForegroundColor Red
    }
    Write-Host ""
}

# Disconnect
Disconnect-VIServer -Confirm:$false