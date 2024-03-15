sudo apt-get update -y
sudo apt-get install apache2 -y
systemctl start apache2

echo "Create a Directory Structure"

mkdir /var/www/html/site1.example.com
mkdir /var/www/html/site2.example.com

/var/www/html/site1.example.com/index.html