FROM nginx:alpine

# Copy the custom Nginx routing rules into the production image
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# BAKE THE CODE: Nginx ONLY needs access to the public files (like CSS, JS, Images, and index.php)
# It does NOT need the backend Laravel source code (.env files, controllers, etc.)
# This is a huge security best practice!
COPY ./src/public /var/www/html/public 


