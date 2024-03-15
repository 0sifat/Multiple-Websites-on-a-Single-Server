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
</html> " > /var/www/html/site1.example.com/index.html

echo "<html>
<title>site2.example.com</title>
<h1>Welcome to site2.example.com Website</h1>
<p>This is my first website hosted with name-based virtual hosting</p>
</html> " > /var/www/html/site2.example.com/index.html


chown -R www-data:www-data /var/www/html/site1.example.com
chown -R www-data:www-data /var/www/html/site2.example.com

echo "<VirtualHost *:80>
ServerAdmin admin@site1.example.com
ServerName site1.example.com
DocumentRoot /var/www/html/site1.example.com
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/site1.example.com_error.log
CustomLog ${APACHE_LOG_DIR}/site1.example.com_access.log combined
</VirtualHost>" > /etc/apache2/sites-available/site1.example.com.conf

echo "<VirtualHost *:80>
ServerAdmin admin@site2.example.com
ServerName site2.example.com
DocumentRoot /var/www/html/site2.example.com
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/site2.example.com_error.log
CustomLog ${APACHE_LOG_DIR}/site2.example.com_access.log combined
</VirtualHost>" > /etc/apache2/sites-available/site2.example.com.conf



a2ensite site1.example.com
a2ensite site2.example.com

systemctl restart apache2