#!/bin/bash

#Mettre à jour les paquets
apt get update

#Installer console-data pour configurer la disposition du clavier
apt-get install -y console-data

#Configurer la disposition du clavier en français
loadkeys fr

#Installer Nginx
apt-get install -y nginx

#Créer un dossier pour l'application
mkdir -p /var/www/app

#Ajouter une page HTML personnalisée
echo "<!DOCTYPE html>
<html>
<head>
<title>Bienvenue</title>
</head>
<body>
<h1>Bienvenue sur ma page déployée ave Vagrant !</h1>
</body>
</html>" > /var/www/app/index.html

#configurer Nginx
cat > /etc/nginx/sites-available/app <<EOL
server {
    listen 80;
    server_name localhost;
    toot /var/www/app;
    index index.html;
    
    location / {
        try_files \$suri \$suri/ =404
    }
}
EOL
#Activer la configuration
systemctl restart nginx