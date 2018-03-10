FROM nginx:1.13

RUN mkdir /etc/nginx/sites-available \
	&& mkdir /var/www \
	&& chown -R www-data:www-data /var/www \
	&& rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY sites /etc/nginx/templates
COPY scripts /root/scripts/

ARG SERVER_NAME

ENV SERVER_NAME=$SERVER_NAME
ENV DOLLAR='$'

RUN echo $SERVER_NAME
RUN /bin/bash /root/scripts/build-nginx.sh

WORKDIR /var/www/$SERVER_NAME

CMD nginx
