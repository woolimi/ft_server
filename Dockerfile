FROM		debian:buster
MAINTAINER	wpark
ARG	DEBIAN_FRONTEND=noninteractive
RUN			apt-get update
RUN			apt-get apt-utils
RUN			apt-get install -y nginx
RUN			service nginx start

CMD			["nginx", "-g", "daemon off;"]

EXPOSE		80
