# Use official PHP image with necessary extensions
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libonig-dev \
    curl \
    && docker-php-ext-install pdo pdo_pgsql mbstring

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy app files
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Generate Laravel key
RUN php artisan key:generate

# Expose port
EXPOSE 8000

# Start Laravel server
CMD php artisan serve --host=0.0.0.0 --port=8000
