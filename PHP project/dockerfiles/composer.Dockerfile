FROM composer:latest

# Even though the official composer image already has this set, 
# defining it explicitly helps us understand how utility containers work.
# The ENTRYPOINT acts as the default unchangeable command. 
# Anything we type after `docker-compose run composer ...` gets appended to this!
ENTRYPOINT ["composer"]
