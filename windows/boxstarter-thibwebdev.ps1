# Example : https://github.com/kmcginnes/BoxStarter/blob/master/BuildPackages/DevBox/tools/ChocolateyInstall.ps1

# Note : .NET Framework 4.0 required

try {
	Set-ExecutionPolicy Unrestricted
	Disable-UAC

	Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
	Set-TaskbarSmall
	Enable-RemoteDesktop


	cinst sublimetext2
	cinst SublimeText2.PackageControl -Version 1.6.3 
	cinst SublimeText3
	cinst SublimeText3.PackageControl 
	cinst notepadplusplus

	cinst 7zip.install
	cinst vlc
	cinst ChocolateyGUI
	cinst flashplayeractivex
	cinst flashplayerplugin 
	cinst adobereader
	cinst ccleaner
	cinst paint.net
	cinst gimp 
	cinst windirstat
	cinst launchy
	cinst procexp
	cinst camstudio
	cinst libreoffice 
	cinst autohotkey_l
	cinst clipx
	cinst virtuawin

	cinst fiddler
	cinst putty
	cinst filezilla
	cinst PhantomJS
	cinst virtualbox
	cinst vagrant 
	cinst mysql.workbench 
	cinst OptiPNG
	cinst jpegoptim 
	cinst LinkShellExtension
	cinst tortoisesvn
	cinst TortoiseGit
	cinst githubforwindows
	cinst SourceTree
	cinst P4Merge
	cinst drush.commandline 
	cinst jscoverage
	cinst jenkins 

	cinst Wget
	cinst curl
	cinst Console2
	cinst ConEmu
	cinst Cygwin
	cinst Cmder 
	cinst cyg-get

	cinst GoogleChrome
	cinst GoogleChrome.Canary 
	cinst Firefox
	cinst Opera
	cinst safari
	cinst ietester 

	cinst nodejs.install
	cinst ruby
	cinst javaruntime
	cinst java.jdk 
	cinst PowerShell 
	cinst python

	$sublimeDir = "$env:programfiles\Sublime Text 2"
	$console2Dir = Join-Path "$env:ChocolateyInstall\lib" (Get-ChildItem "$env:ChocolateyInstall\lib" | ?{$_.name -match "^console2\.\d+"})

	Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
    Install-ChocolateyPinnedTaskBarItem "$console2Dir\bin\Console.exe"
    Install-ChocolateyPinnedTaskBarItem "$sublimeDir\sublime_text.exe"

	Install-ChocolateyFileAssociation ".txt" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".log" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".config" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".xml" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".ps1" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".psm" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".cs" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".cshtml" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".csproj" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".rb" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".js" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".css" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".less" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".pl" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".sh" "$sublimeDir\sublime_text.exe"
    Install-ChocolateyFileAssociation ".java" "$sublimeDir\sublime_text.exe"

	Install-WindowsUpdate -AcceptEula

    Write-ChocolateySuccess 'ThibWebDev'
} catch {
	Write-ChocolateyFailure 'ThibWebDev' $($_.Exception.Message)
	throw
}