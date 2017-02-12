FROM nginx:1

ADD src /opt/src
ADD ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
