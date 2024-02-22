# `systemd` Unit Files to Check into the #APRSThursday Net

These files will let you check into [the #APRSThursday net](https://aprsph.net/aprsthursday/) via APRS-IS automatically.

## Installation
1. [Install PowerShell 7.4 or newer on your Linux computer](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux).
2. Edit the `Send-APRSThursdayCheckin.ps1` file.  Type your callsign in the `From` string, and optionally edit the check-in message.
3. Run `./install.sh`.  That will install the required files, adjust file permissions, and enable the `systemd` timer.

## When It Runs
The `systemd` timer will run sometime between 00:00 <abbr title="Coordinated Universal Time">UTC</abbr> and 23:01 <abbr title="Coordinated Universal Time">UTC</abbr>.  When it runs, it will install or update my [APRSMessenger module](https://github.com/rhymeswithmogul/APRSMessenger) from PowerShell Gallery.  Then, it will send an APRS message, checking you in.

## Complaints
Linux purists have multiple reasons to hate this code.  However, feel free to submit issues and pull requests.
