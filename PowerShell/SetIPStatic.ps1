# Get the current IP address configuration for the LAN adapter
$currentIP = (Get-NetIPConfiguration | Where-Object {$_.NetProfile.Name -eq "hayball.local"}).IPv4Address
$currentSUBNET = (get-wmiobject -class win32_networkadapterconfiguration | where-object {$_.DNSDomain -eq "hayball.local"}).ipsubnet | select-object -first 1

# Set the IP address, subnet mask, and default gateway
netsh interface ip set address name="$currentIP.InterfaceAlias" static $currentIP.IPv4Address $currentSUBNET $currentIP.DefaultGateway
netsh interface ip add dns name="$currentIP.InterfaceAlias" 10.0.0.5
netsh interface ip add dns name="$currentIP.InterfaceAlias" 10.0.0.3 index=2