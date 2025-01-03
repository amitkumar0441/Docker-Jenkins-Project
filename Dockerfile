FROM centos:8

# First, update yum and check for errors
RUN yum -y update

# Then install packages separately
RUN yum install -y httpd
RUN yum install -y zip unzip wget

# Download the template
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip -P /var/www/html/

# Set the working directory to /var/www/html
WORKDIR /var/www/html/

# Unzip the template
RUN unzip neogym.zip

# Copy files from the extracted folder to the current directory
RUN cp -rvf neogym-html/* . 

# Clean up unnecessary files
RUN rm -rf neogym-html neogym.zip

# Set the container to start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for the HTTP server
EXPOSE 80
