FROM ubuntu:16.04
MAINTAINER Mukesh Panigrahi <mukesh.panigrahi@searce.com>
 
#Update Repository
RUN apt-get update -y
 
#Install Apache
RUN apt-get install -y apache2
 
#Install PHP Modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-gd php7.0-xml
 
#Copy Application Files
RUN rm -rf /var/www/html/*
COPY index.php /var/www/html
 
#Configure Apache (Optional)
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
 
#Open port 80
EXPOSE 80
 
#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
