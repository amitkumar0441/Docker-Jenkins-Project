FROM  centos:latest
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
# line in this Dockerfile if you want the container to start the Apache HTTP Server (httpd) in the foreground when it runs.
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] 
EXPOSE 80
