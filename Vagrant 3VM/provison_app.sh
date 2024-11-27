#!/ bin/ bash

# Mise jour des paquets
apt-get update -y
apt-get install -y nginx

# C r e r une page HTML c u s t o m i s e
echo "<h1> Bienvenue sur VM $(hostname)</h1>" > /var/www/html/index.html

# D m a r r e r Nginx
systemctl start nginx
systemctl enable nginx