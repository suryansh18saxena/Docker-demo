FROM ubuntu:24.04

ARG REPO_URL=https://github.com/suryansh18saxena/Docker-demo.git
ARG BRANCH=main

RUN apt-get update && apt-get install -y apache2 git ca-certificates \
    && rm -rf /var/www/html/* \
    && git clone --depth 1 --branch "$BRANCH" "$REPO_URL" /tmp/site \
    && cp -a /tmp/site/. /var/www/html/ \
    && rm -rf /tmp/site

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
