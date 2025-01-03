FROM  centos:latest
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip neogym.zip
RUN cp -rvf neogym-html/* .
RUN rm -rf neogym-html neogym.zip
# line in this Dockerfile if you want the container to start the Apache HTTP Server (httpd) in the foreground when it runs.
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"] 
EXPOSE 80
