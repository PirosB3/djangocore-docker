FROM python

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/django/django.git /django

RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

ADD run /usr/local/bin/run
VOLUME ["/django"]
ENTRYPOINT ["/usr/local/bin/run"]
CMD ["--help"]
