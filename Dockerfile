#FROM php:7.4.27-apache-buster
#FROM php:7-apache
FROM centos:7

RUN yum -y install httpd \
&& yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
&& yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
&& yum-config-manager --enable remi-php73 \
&& yum -y update \
&& yum -y install php php-cli php-bcmath php-common php-fpm php-mcrypt php-curl php-zip php-gd php-mbstring php-mysqli \
 php-mysqlnd php-pdo php-pecl-memcache php-pgsql.x86_64 php-snmp php-soap php-xml \
  php-xmlrpc php-bz2 php-ds  yum install mod_evasive mod_ssl memcached

COPY httpd.conf /etc/httpd/conf/
COPY php.ini /etc/php.ini

CMD ["httpd", "-DFOREGROUND"]