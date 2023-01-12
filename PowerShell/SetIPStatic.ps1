# Get the current IP address configuration for the LAN adapter
$currentIP = (Get-NetIPConfiguration | Where-Object {$_.NetProfile.Name -eq "hayball.local"}).IPv4Address
$defaultgateway = (Get-NetIPConfiguration | Where-Object {$_.NetProfile.Name -eq "hayball.local"}).IPv4DefaultGateway
$interfacealias = (Get-NetIPConfiguration | Where-Object {$_.NetProfile.Name -eq "hayball.local"}).InterfaceAlias
$ipsubnet = (get-wmiobject -class win32_networkadapterconfiguration | where-object {$_.DNSDomain -eq "hayball.local"}).ipsubnet | select-object -first 1
$mask = $ipsubnet.split(".")
$cidr = [int] 0
$octet = [int] 0
foreach ($octet in $mask) {
    if ($Octet -eq 255){$CIDR += 8}
    if ($Octet -eq 254){$CIDR += 7}
    if ($Octet -eq 252){$CIDR += 6}
    if ($Octet -eq 248){$CIDR += 5}
    if ($Octet -eq 240){$CIDR += 4}
    if ($Octet -eq 224){$CIDR += 3}
    if ($Octet -eq 192){$CIDR += 2}
    if ($Octet -eq 128){$CIDR += 1}
}

# Set the IP address, subnet mask, and default gateway
Remove-NetIPAddress -interfacealias $interfacealias -AddressFamily IPv4
New-NetIPAddress -interfacealias $interfacealias -ipaddress $currentIP -prefixlength $cidr -defaultgateway $DefaultGateway