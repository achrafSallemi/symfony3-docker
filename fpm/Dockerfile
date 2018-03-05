FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common language-pack-en-base \
    && LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.0 php7.0-fpm mcrypt php7.0-gd php7.0-mysql php7.0-xml php7.0-mbstring curl zip unzip \
       php7.0-curl supervisor git \
    && mkdir /run/php \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN sed -i -e 's/listen = \/run\/php\/php7.0-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i -e 's/;daemonize = yes/daemonize = no/g' /etc/php/7.0/fpm/php-fpm.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY *.sh /

WORKDIR /var/app
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord"]