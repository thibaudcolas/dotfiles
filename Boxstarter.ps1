# Note : .NET Framework 4.0 required

Write-BoxstarterMessage "Execution du script en cours"
#Importe les modules de BoxStarterChocolatey pour l'execution des commandes
Import-Module Boxstarter.Chocolatey
Write-BoxstarterMessage "Importation des modules Boxstarter Chocolatey finie"
	
#Permet d'enlever le controle du compte utilisateur
Disable-UAC
Write-BoxstarterMessage "Desactivation du controle du compte utilisateur"

#Installation des différents logiciels
#Outils de Dev
Write-BoxstarterMessage "INSTALLATION DES OUTILS DE DEVELOPPEMENT"
	#Fiddler
	Write-BoxstarterMessage "Installation de Fiddler"
	cinst fiddler
	#MySQLWorkbench
	Write-BoxstarterMessage "Installation de MySQLWorkbench"
	cinst mysql.workbench
#Moteur d'execution
Write-BoxstarterMessage "INSTALLATION DES MOTEURS D'EXECUTION"
	#.Net4.5
	Write-BoxstarterMessage "Installation de .Net4.5"
	cinst DotNet4.5
	#JAVA Runtime 7
	Write-BoxstarterMessage "Installation de JAVA Runtime 7"
	cinst javaruntime
	#NodeJS
	Write-BoxstarterMessage "Installation de NodeJS"
	cinst nodejs.install
	#Python
	Write-BoxstarterMessage "Installation de Python"
	cinst python
	#Ruby
	Write-BoxstarterMessage "Installation de Ruby"
	cinst ruby
#Navigateur Internet
Write-BoxstarterMessage "INSTALLATION DES NAVIGATEURS INTERNET"
	#Mozilla Firefox
	Write-BoxstarterMessage "Installation de Mozilla Firefox"
	cinst Firefox
	#Opera
	Write-BoxstarterMessage "Installation d'Opera"
	cinst Opera
	#Safari
	Write-BoxstarterMessage "Installation de Safari"
	cinst safari
#Editeur de texte
Write-BoxstarterMessage "INSTALLATION DES EDITEURS DE TEXTE"
	#Notepad++
	Write-BoxstarterMessage "Installation de Notepad++"
	cinst notepadplusplus
	#Sublime Text 2
	Write-BoxstarterMessage "Installation de Sublime Text 2"
	cinst sublimetext2
	Write-BoxstarterMessage "Ajout du Package Control"
	cinst SublimeText2.PackageControl
#Utilitaire
Write-BoxstarterMessage "INSTALLATION DE LOGICIELS UTILITAIRES"
	#7Zip
	Write-BoxstarterMessage "Installation de 7Zip"
	cinst 7zip
	#Adobe Reader
	Write-BoxstarterMessage "Installation d'Abode Reader"
	cinst adobereader
	#CCleaner
	Write-BoxstarterMessage "Installation de CCleaner"
	cinst ccleaner
	#ClipX
	Write-BoxstarterMessage "Installation de ClipX"
	cinst clipx
	#Cmder
	Write-BoxstarterMessage "Installation de Cmder"
	cinst Cmder
	#Console2
	Write-BoxstarterMessage "Installation de Console2"
	cinst Console2
	#Drush Command Line
	Write-BoxstarterMessage "Installation de Drush Commandline"
	cinst drush.commandline
	#LinkShellExtension
	Write-BoxstarterMessage "Installation de LinkShellExtension"
	cinst LinkShellExtension
	#VirtuaWin
	Write-BoxstarterMessage "Installation de VirtuaWin"
	cinst virtuawin
	#WinMerge
	Write-BoxstarterMessage "Installation de WinMerge"
	cinst winmerge
#SVN/Git
Write-BoxstarterMessage "INSTALLATION DES LOGICIELS SVN/Git"
	#GitHub
	Write-BoxstarterMessage	"Installation de GitHub"
	cinst GitHub
	#TortoiseSVN
	Write-BoxstarterMessage "Installation de TortoiseSVN"
	cinst tortoisesvn
	#TortoiseGit
	Write-BoxstarterMessage "Installation de TortoiseGit"
	cinst TortoiseGit
#Media
Write-BoxstarterMessage "INSTALLATION DES LOGICIELS MEDIA"
	#Camstudio
	Write-BoxstarterMessage "Installation de Camstudio"
	cinst camstudio
	#FlashPlayer ActiveX
	Write-BoxstarterMessage "Installation de FlashPlayer ActiveX"
	cinst flashplayeractivex
	#FlashPlayer Plugin
	Write-BoxstarterMessage "Installation de FlashPlayer Plugin"
	cinst flashplayerplugin
	#Gimp
	Write-BoxstarterMessage "Installation de Gimp"
	cinst gimp
	#Greenshot
	Write-BoxstarterMessage "Installation de Greenshot"
	cinst greenshot
	#IrfanView
	Write-BoxstarterMessage "Installation de IrfanView"
	cinst IrfanView
	#Paint.Net
	Write-BoxstarterMessage "Installation de Paint.Net"
	cinst paint.net
	#VLC
	Write-BoxstarterMessage "Installation de VLC"
	cinst vlc
#Conception
Write-BoxstarterMessage "INSTALLATION DES LOGICIELS DE CONCEPTION"
	#ArgoUML
	Write-BoxstarterMessage "Installation d'ArgoUML"
	cinst argouml
#Client FTP
Write-BoxstarterMessage "INSTALLATION DES LOGICIELS CLIENT FTP"
	#FileZilla
	Write-BoxstarterMessage "Installation de FileZilla"
	cinst filezilla
	#Putty
	Write-BoxstarterMessage "Installation de Putty"
	cinst putty
#Virtualisation
Write-BoxstarterMessage "INSTALLATION DES LOGICIELS DE VIRTUALISATION"
	#Vagrant
	Write-BoxstarterMessage "Installation de Vagrant"
	cinst vagrant
	
#Permet de remettre le controle du compte utilisateur
Enable-UAC
Write-BoxstarterMessage "Activation du controle du compte utilisateur"

Write-BoxstarterMessage "Fin de l'installation de votre poste."
exit
		
	
		