##Script de configuration de poste

	#Permet de débloquer l'execution des scripts
	Set-ExecutionPolicy Unrestricted -Force

	#Importe les modules de BoxStarterChocolatey pour l'execution des commandes
	Import-Module Boxstarter.Chocolatey
	Write-BoxstarterMessage "Importation des modules Boxstarter Chocolatey"
	
	#Permet d'enlever le controle du compte utilisateur
	Disable-UAC
	Write-BoxstarterMessage "Desactivation du controle du compte utilisateur"

	if (Test-Admin -eq true) {
	
	Write-BoxstarterMessage "Bienvenue dans la gestion de quelques parametres de Windows"
		#configuration de la barre de tâche
		Write-BoxstarterMessage "Vous allez configurer la barre de tache"
			Write-BoxstarterMessage "La barre de tache doit etre large ou petite ? Large = 1 / Petite = 2"	
			$config1=Read-Host "Veuillez entrer la valeur souhaitee"
			$config1
			if ($config1 -eq 1) {
				Set-TaskbarOptions -Size Large
			}
			else {
				Set-TaskbarOptions -Size Small	
			}
		#configuration de l'explorateur Windows
		Write-BoxstarterMessage "Vous allez configurer l'explorateur Windows"
			Write-BoxstarterMessage "L'explorateur Windows doit afficher les fichiers caches ? Oui = 1 / Non = 2"
			$config2=Read-Host "Veuillez saisir la valeur souhaitee"
			$config2
			if ($config2 -eq 1) {
				Set-WindowsExplorerOptions -EnableshowHiddenFilesFoldersDrives
			}
			else {
				Set-WindowsExplorerOptions -DisableshowHiddenFilesFoldersDrives
			}
			Write-BoxstarterMessage "Voulez vous afficher les extensions des fichiers ? Oui = 1 / Non = 2"
			$config3=Read-Host "Veuillez saisir la valeur voulue"
			$config3
			if ($config3 -eq 1) {
				Set-WindowsExplorerOptions -EnableShowFileExtensions
			}
			else {
				Set-WindowsExplorerOptions -DisableShowFileExtensions
			}
	}
	else {
		Write-BoxstarterMessage "Veuillez demander les droits d'administration sur votre compte"
	}

	Write-BoxstarterMessage "Votre poste est fini d'etre configuree"