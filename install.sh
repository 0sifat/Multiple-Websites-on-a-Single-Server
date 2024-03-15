sudo apt-get update -y
sudo apt-get install apache2 -y
systemctl start apache2

echo "Create a Directory Structure"

mkdir /var/www/html/site1.example.com
mkdir /var/www/html/site2.example.com


echo "<html>
<title>site1.example.com</title>
<h1>Welcome to site1.example.com Website</h1>
<p>This is my first website hosted with name-based virtual hosting</p>
</html> " /var/www/html/site1.example.com/index.html