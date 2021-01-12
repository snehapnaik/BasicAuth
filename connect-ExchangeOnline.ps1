#Run Powershell as an Administrator. This is called elevated Powershell session for further reference.
#Change execution policy of Powershell for downloading modules
Set-ExecutionPolicy RemoteSigned 

#Get user credentials. Enter username and password in the following pop-up window
$Credentials = Get-Credential

#Run the following cmdlet to establish a session

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credentials -Authentication Basic -AllowRedirection

#If you are using a proxy server then your session cmdlet will be different.
#Run this command first before the $Session cmdlet
#$ProxyOptions = New-PSSessionOption -ProxyAccessType <Value>
#Where <value> should be replaced by "IEConfig", "WinHttpConfig", or "AutoDetect"
#Now run the new $Session cmdlet instead of line 10
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credentials -Authentication Basic -AllowRedirection -SessionOption $ProxyOptions

#Import the session by running the following command:
Import-PSSession $Session -DisableNameChecking

#Dont forget to close the session
Remove-PSSession $Session


#NOTES:
#Most of the companies are moving away from basic Auth to Modern Auth or MFA.
#Make sure to check that Basic Auth is on the network for these cmdlets to work
#To check run the following cmdlet in the Command Prompt:
<#
winrm get winrm/config/client/auth
#>
#If you see Basic=True only then basic Auth script will work
