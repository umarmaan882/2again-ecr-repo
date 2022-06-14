FROM ubuntu:20.04

RUN apt update -y && \
apt upgrade -y && \
apt -y install software-properties-common && \
apt -y install apache2 libapache2-mod-fcgid composer && \
a2enmod rewrite actions fcgid alias proxy_fcgi && \
add-apt-repository ppa:ondrej/php && \
apt-get update && \
apt install -y php7.4 php7.4-cli php7.4-fpm php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring \
php7.4-curl php7.4-xml php-pear php7.4-bcmath
RUN sudo npm cache clean -f 
RUN sudo npm install -g n
RUN sudo n 14.19.0
RUN sudo install pm2
COPY apache_api.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /etc/php.ini
ENTRYPOINT service apache2 start && service php7.4-fpm start && bash



