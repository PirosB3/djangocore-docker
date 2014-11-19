FROM python

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/django/django.git /django
RUN apt-get install -y locales
RUN locale-gen en_US en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ADD run /usr/local/bin/run
VOLUME ["/django"]
ENTRYPOINT ["/usr/local/bin/run"]
