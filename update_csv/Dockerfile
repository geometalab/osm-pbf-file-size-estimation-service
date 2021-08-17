FROM python:3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    wget \
    parallel \
    osmctools \
    osmium-tool

WORKDIR /home/py

ADD . /home/py/

CMD ./update_size_csv.sh
