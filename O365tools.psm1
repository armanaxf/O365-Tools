<#
.Synopsis
Conencts to O365 and Exchange Online.
.DESCRIPTION
Establishes a simultaneous connection to O365 and Exchange Online Powershell
#>
function Connect-O365 {
    $o365cred = Get-Credential 
    $session365 = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell/" -Credential $o365cred -Authentication Basic -AllowRedirection 
    Import-Module (Import-PSSession $session365 -AllowClobber) -Global
    connect-msolservice -Credential $o365cred
}

function new-365user
{
[cmdletbinding()]
Param(
[parameter(Mandatory=$True)]
 [String]$firstname,
 [String]$lastname,
 [string]$email,
 [parameter(Mandatory=$False)]
 [String]$Groups
)

 $fullname = "$firstname $lastname"

 New-msoluser -UserPrincipalName $email -DisplayName $fullname -FirstName $firstname -LastName $lastname -UsageLocation "GB"
 set-MailboxRegionalConfiguration -identity $email -Language en-GB -TimeZone "GMT Standard Time" -DateFormat dd-MMM-yy -Timeformat HH:mm

 }

 function add-365license
{
[cmdletbinding()]
Param(
[parameter(mandatory=$True)]
 [String]$license,
 [String]$email
)
 set-msoluserlicense -addlicenses $License -userprincipalname $email
 }
