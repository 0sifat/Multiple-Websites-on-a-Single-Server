I just Used Apache on Ubuntu Server


Install Apache Web Server

First, install the Apache web server by running the following commands:

apt-get update -y

apt-get install apache2 -y

Once the installation is completed, start the Apache service with the following command:

systemctl start apache2

Name-Based Virtual Hosting

Name-based virtual hosting is the most commonly used method to host multiple websites on the same IP address and Port. You will need valid domain names to host numerous websites using name-based virtual hosting.

In this section, we will use site1.example.com and site2.example.com to host two websites on a single server.
Step 1 – Create a Directory Structure

First, create a document root directory for both websites:

mkdir /var/www/html/site1.example.com
mkdir /var/www/html/site2.example.com

Next, create an index.html page for both websites.

First, create an index.html page for site1.example.com:

nano /var/www/html/site1.example.com/index.html

Add the following lines:

<html>
<title>site1.example.com</title>
<h1>Welcome to site1.example.com Website</h1>
<p>This is my first website hosted with name-based virtual hosting</p>
</html>

Next, create an index.html page for site2.example.com:

nano /var/www/html/site2.example.com/index.html

Add the following lines:

<html>
<title>site2.example.com</title>
<h1>Welcome to site2.example.com Website</h1>
<p>This is my second website hosted with name-based virtual hosting</p>
</html>

Next, change the ownership of site1.example.com and site2.example.com directory to www-data:

chown -R www-data:www-data /var/www/html/site1.example.com
chown -R www-data:www-data /var/www/html/site2.example.com

Step 2 – Create a Virtual Host Configuration File

Next, you must create an Apache virtual host configuration file to serve both websites.

First, create an Apache virtual host configuration file for site1.example.com:

nano /etc/apache2/sites-available/site1.example.com.conf

Add the following lines:

<VirtualHost *:80>
ServerAdmin admin@site1.example.com
ServerName site1.example.com
DocumentRoot /var/www/html/site1.example.com
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/site1.example.com_error.log
CustomLog ${APACHE_LOG_DIR}/site1.example.com_access.log combined
</VirtualHost>

Save and close the file.

Next, create an Apache virtual host configuration file for site2.example.com:

nano /etc/apache2/sites-available/site2.example.com.conf

Add the following lines:

<VirtualHost *:80>
ServerAdmin admin@site2.example.com
ServerName site2.example.com
DocumentRoot /var/www/html/site2.example.com
DirectoryIndex index.html
ErrorLog ${APACHE_LOG_DIR}/site2.example.com_error.log
CustomLog ${APACHE_LOG_DIR}/site2.example.com_access.log combined
</VirtualHost>

Save and close the file. Then, enable the virtual host configuration file with the following commands:

a2ensite site1.example.com
a2ensite site2.example.com

Next, restart the Apache webserver to apply the configuration changes:

systemctl restart apache2
