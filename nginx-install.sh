#!/bin/bash

# Mettre à jour les paquets existants
sudo apt-get update -y

# Installer NGINX
sudo apt-get install -y nginx

# Démarrer NGINX et l'ajouter au démarrage automatique
sudo systemctl start nginx
sudo systemctl enable nginx

# Ouvrir le port 80 pour HTTP dans le pare-feu (UFW)
sudo ufw allow 'Nginx HTTP'

# Vérifier que NGINX fonctionne
sudo systemctl status nginx

# Optionnel : Vous pouvez ajouter ici des étapes supplémentaires pour personnaliser votre installation NGINX
# Par exemple, remplacer le fichier de configuration ou ajouter un site par défaut
