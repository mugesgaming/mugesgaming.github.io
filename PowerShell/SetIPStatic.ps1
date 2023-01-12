# Get the current IP address configuration for the LAN adapter
$currentIP = (Get-NetIPConfiguration | Where-Object {$_.DNSSuffix -eq "hayball.local"}).IPv4Address

# Set the IP address, subnet mask, and default gateway
New-NetIPAddress -InterfaceIndex $currentIP.InterfaceIndex -IPAddress $currentIP.IPAddress -PrefixLength $currentIP.PrefixLength -DefaultGateway $currentIP.DefaultGateway