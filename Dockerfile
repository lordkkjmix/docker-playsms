FROM ubuntu:focal
LABEL Kuoakou koffi josue <lordkkjmix@gmail.com>
ADD README.md /README.md

# Installation des paquets requis
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get -y upgrade
RUN apt-get -y install git nginx mariadb-client php8.0 php8.0-fpm php8.0-cli php8.0-mysql php8.0-gd php8.0-imap php8.0-curl php8.0-xml php8.0-mbstring php8.0-zip


# Configuration Nginx
ADD start-nginx.sh /start-nginx.sh
ADD nginx_default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /var/www/html/*

# Configuration MySQL (utilisation d'une base de données externe)
# Assurez-vous de configurer les variables d'environnement pour la connexion à la base de données

# Installation de playSMS
ADD start-playsmsd.sh /start-playsmsd.sh
ADD create_db.sh /create_db.sh
RUN rm -rf /app && mkdir /app && git clone --branch 1.4.7 --depth=1 https://github.com/playsms/playsms.git /app
ADD install.conf /app/install.conf
ADD .env /.env
ADD install.sh /install.sh

# Configuration PHP
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_POST_MAX_SIZE 8M

# Finalisation des scripts
ADD run.sh /run.sh
ADD start.sh /start.sh
RUN chmod +x /*.sh


EXPOSE 80
CMD ["/run.sh"]
