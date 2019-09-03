FROM centos:6.8

ENV NGINX_VERSION 1.15.6
# Init centos
ENV TERM="linux"
ENV TERMINFO="/etc/terminfo"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV TZ="PRC"

RUN CONFIG="\
                --user=nginx \
                --group=nginx \
                --prefix=/usr/local/nginx \
                --with-http_stub_status_module \
                --with-http_ssl_module \
        " \
        && useradd nginx -s /sbin/nologin \
        && yum makecache fast \
        && yum install vim openssl openssl-devel pcre pcre-devel gcc epel-release openssh-server -y \
        && curl -fSL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -o /usr/local/src/nginx-$NGINX_VERSION.tar.gz  \
        && tar -xvf /usr/local/src/nginx-$NGINX_VERSION.tar.gz  -C /usr/local/src \
        && cd /usr/local/src/nginx-$NGINX_VERSION \
        && ./configure $CONFIG \
        && make \
        && make install \
        && rm /usr/local/src/* -rf \
        && rm /usr/local/nginx/conf/nginx.conf -rf \
        && yum install supervisor -y \
        && mkdir /etc/supervisor \
        && chkconfig --level 2345 supervisord on \
        && yum clean all 

COPY config/conf/nginx.conf /usr/local/nginx/conf/nginx.conf
COPY config/nginx.conf /usr/local/nginx/nginx.conf
COPY config/localtime /etc/localtime
COPY config/supervisord.conf /etc/supervisor/

EXPOSE 8443
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
