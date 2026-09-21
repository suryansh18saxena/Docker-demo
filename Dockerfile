FROM ubuntu:24.04

ARG REPO_URL=https://github.com/suryansh18saxena/Docker-demo.git
ARG BRANCH=main

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends apache2 git ca-certificates \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/www/html/* \
	&& test -n "$REPO_URL" \
	&& git clone --depth 1 --branch "$BRANCH" "$REPO_URL" /tmp/site \
	&& cp -a /tmp/site/. /var/www/html/ \
	&& rm -rf /tmp/site \
	&& chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
