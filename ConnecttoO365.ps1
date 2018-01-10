Set-ExecutionPolicy RemoteSigned
 $Credential = Get-Credential
 $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credential -Authentication Basic -AllowRedirection
 Import-PSSession $Session
 Connect-MsolService -Credential $Credential