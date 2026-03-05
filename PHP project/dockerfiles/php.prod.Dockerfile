# ==========================================
# STAGE 1: Build Dependencies using Composer
# ==========================================
# We use a temporary composer image just to download the vendor packages.
# This prevents our final production image from needing composer installed!
FROM composer:latest as builder
WORKDIR /app

# Copy all the source code into the builder container
COPY ./src /app

# Install dependencies optimized for production (no dev packages like PHPUnit)
RUN composer install --optimize-autoloader --no-dev


# ==========================================
# STAGE 2: The Actual Production Server
# ==========================================
FROM php:8.4-fpm

# Install standard extensions
RUN apt-get update && apt-get install -y \
    git curl libpng-dev libonig-dev libxml2-dev zip unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

WORKDIR /var/www/html

# 1. BAKE THE CODE: Copy everything from the 'builder' stage into the final image
COPY --from=builder /app /var/www/html

# 2. BAKE THE PERMISSIONS: Give the www-data user permanent ownership of the storage and cache!
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
