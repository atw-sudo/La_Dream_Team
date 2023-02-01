FROM atw1a/dbcredsphp

# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    libssl-dev \
    mariadb-client \
    && docker-php-ext-install -j$(nproc) iconv zip pdo_mysql mysqli \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Enable mod_rewrite
RUN a2enmod rewrite

# Copy PHP application
COPY . /var/www/html/

# Create PHP sessions directory
RUN mkdir -p /var/lib/php/sessions

# Set PHP sessions directory permissions
RUN chown -R www-data:www-data /var/lib/php/sessions

# Expose port 80
EXPOSE 80

Expose 3306

# Copy local SQL database
COPY project.sql /tmp/

# Make the script executable
RUN chmod +x /tmp/script.sh

# Execute the script
RUN /tmp/script.sh

# Restart Apache2
RUN service apache2 start 

