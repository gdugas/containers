FROM python:2

RUN apt-get update
RUN apt-get install -y \
    apache2-utils \
    pwgen


RUN pip install trac


WORKDIR /usr/local


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
CMD ["tracd", "-s", "-p", "8080", "--basic-auth='project,/usr/local/project/.htpasswd,Trac auth'", "/usr/local/project"]
