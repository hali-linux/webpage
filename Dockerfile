FROM ubuntu:16.04
RUN cp /etc/apt/sources.list ~/sources.list.old
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN diff ~/sources.list.old /etc/apt/sources.list | wc -l
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx
ADD testsite.tar /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
