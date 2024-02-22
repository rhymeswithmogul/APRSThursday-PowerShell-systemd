#!/usr/bin/env pwsh
#Requires -Version 7.4

#######################################################################
# PLEASE CUSTOMIZE YOUR CALLSIGN, SERVER, AND MESSAGE.
# Optionally, you can include your location.
# Supported clients may show your message on a map.
#######################################################################
$CheckIn = @{
	'From'      = 'YOUR-CALLSIGN-GOES-HERE'
	'To'        = 'ANSRVR'
	'Server'    = 'noam.aprs2.net'		# any of the Tier 2 servers
	'Latitude'  = $null		# or degrees north, -90 to 90
	'Longitude' = $null		# or degrees east, -180 to 180
	'Message'   = 'CQ HOTG Happy #APRSThursday'
}
#######################################################################
# Thank you for editing.
# If you did not, the next lines will intentionally stop the script.
#######################################################################

If ($CheckIn.From -eq 'YOUR-CALLSIGN-GOES-HERE') {
	Throw [System.FormatException]::new('Please edit this script and type in your callsign.')
}

#region Install or update the module
$ModuleInfo = @{
	'Name'            = 'APRSMessenger'
	'Repository'      = 'PSGallery'
	'TrustRepository' = $true
}

Update-PSResource @ModuleInfo `
	|| Install-PSResource @ModuleInfo -ErrorAction Stop
#endregion

#region Check in
Send-APRSMessage @CheckIn `
	&& Write-Output "$($CheckIn.From) checked into the #APRSThursday net at $((Get-Date)):  `"$($CheckIn.Message)`""
#endregion