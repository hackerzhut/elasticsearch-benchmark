FROM openjdk:10-jdk

ENV ES_END_POINT=""
ENV PIPELINE="--pipeline=benchmark-only"
ENV CREDENTIALS=""
ENV CLUSTERHEALTH=""
ENV REPORTFMT="markdown"
ENV VERSION="6.2"

RUN apt-get update
RUN apt-get install --yes git gcc python3-pip python3-dev \
    && pip3 install esrally

COPY . /es-tracks/
WORKDIR /es-tracks/

RUN useradd -ms /bin/bash elasticsearch
RUN chown -R elasticsearch:elasticsearch /es-tracks
RUN chmod 755 /es-tracks
USER elasticsearch


CMD esrally configure; esrally $PIPELINE --target-hosts=$ES_END_POINT --preserve-install true --track-path=.
