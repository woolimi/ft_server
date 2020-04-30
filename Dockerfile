FROM debian:buster

MAINTAINER Woolim PARK <wpark@student.42.fr>

RUN apt-get update && apt-get upgrade -y \
&& apt-get -y install wget \
&& apt-get -y install nginx \
&& apt-get -y install php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cli php-fpm php-cgi \
&& apt-get -y install php-mysql \
&& apt-get -y install mariadb-server \
&& apt-get clean -y

COPY srcs/php.ini /tmp/php.ini
COPY srcs/wordpress.tar.gz /tmp/wordpress.tar.gz
COPY srcs/wp-config.php /tmp/wp-config.php
COPY srcs/nginx_config /tmp/nginx_config
COPY srcs/index.php /tmp/index.php
COPY srcs/start.sh /tmp/start.sh
COPY srcs/mkcert-v1.1.2-linux-amd64 /tmp/mkcert

EXPOSE 80
EXPOSE 443

CMD bash /tmp/start.sh && sleep infinity & wait

#### DOCKER COMMAND
#
# 1. download image from dockerhub
# docker pull debian:buster
#
# 2. see docker process
# docker ps (-a)
#
# 3. see images
# docker images
#
# 4. see containers
# docker contianer ls -a
# 
# 5. build another image using Dockerfile
# docker build --tag (tag_name) (Dockefile_path) 
#
# 6. create container by image
# docker create (image_name)
#
# 7. execute container
# docker start (container_name)
#
# 8. stop container
# docker stop (container_name)
#
# 9. enter into container
# docker attatch (container_name)
#
# 10.make container && execute container
# docker run --rm -it (image or container name)
#
# 11.communicate container <-> host 
# docker cp [host file path] [container name]:[container file path]
# docker cp [container name]:[container file path] [host file path]
