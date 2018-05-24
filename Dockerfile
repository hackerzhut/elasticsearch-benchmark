FROM openjdk:10-jdk

# Default
ENV ES_END_POINT="https://10.39.34.186/"

RUN apt-get update
RUN apt-get install --yes git gcc python3-pip python3-dev \
    && pip3 install esrally

COPY . /es-tracks/
WORKDIR /es-tracks/

RUN useradd -ms /bin/bash elasticsearch
RUN chown -R elasticsearch:elasticsearch /es-tracks
RUN chmod 755 /es-tracks
USER elasticsearch


CMD esrally configure; esrally --pipeline=benchmark-only --target-hosts=$ES_END_POINT --preserve-install true --track-path=.
