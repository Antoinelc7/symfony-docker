########## Étape de développement ##########
FROM php:8.1-fpm AS development

# Installer les dépendances nécessaires pour le développement
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libzip-dev

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install pdo pdo_mysql


########## Installez Composer ##########
FROM composer:2.1 AS composer

# Autoriser Composer en tant que superutilisateur
ENV COMPOSER_ALLOW_SUPERUSER=1

# Définir le working directory
WORKDIR /var/www/html

# Copiez le fichier composer.json
<<<<<<< HEAD
COPY composer.json /var/www/html/composer.json
=======
COPY symfony_docker_project/composer.json /var/www/html/composer.json
>>>>>>> e2cd64063e81f4ffba3ec024b5fd65a378cdd22f

# Installez les dépendances de développement et de preprod
RUN composer install --no-interaction --optimize-autoloader

# Réglez les permissions si nécessaire
RUN chown -R www-data:www-data .

# Configurez le fichier ini pour PHP pour le développement
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"




########## Étape de préproduction ##########
FROM nginx:1.21 AS preproduction

# Supprimez le fichier de configuration par défaut de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copiez le fichier de configuration Nginx personnalisé
COPY nginx/nginx.conf /etc/nginx/conf.d/






########## Étape par défaut ##########
FROM mysql:5.7 AS default

# Définir le mot de passe root pour MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword