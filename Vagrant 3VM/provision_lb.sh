#!/ bin/ bash

# Mise jour des paquets
apt-get update -y
apt-get install -y nginx

# Configuration de Nginx pour Load Balancing
cat > /etc/nginx/sites-available/default <<EOL
upstream app_cluster {
server 192.168.50.4;
server 192.168.50.5;
server 192.168.50.6;
}

server {
    listen 80;

    location / {
        proxy_pass http://app_cluster;
    }
}
EOL

# R e d m a r r e r Nginx
systemctl restart nginx
systemctl enable nginx