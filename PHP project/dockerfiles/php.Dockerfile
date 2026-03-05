FROM php:8.4-fpm

# Install system dependencies and PHP extensions required by Laravel
# This is like installing the necessary system tools so PHP can talk to MySQL, etc.
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install the actual PHP extensions using a helper script provided by the PHP image
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Set the working directory
WORKDIR /var/www/html
