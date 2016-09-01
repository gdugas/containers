FROM python:2

RUN apt-get update
RUN apt-get install -y \
    apache2-utils \
    pwgen


RUN pip install trac


WORKDIR /usr/local


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD ["tracd", "-p", "8080", "-e", "/usr/local", "--basic-auth='project,/usr/local/.htpasswd,Trac auth'", "/usr/local/project"]
