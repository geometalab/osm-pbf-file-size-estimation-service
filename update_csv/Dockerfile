FROM debian:buster

MAINTAINER Geometalab HSR <geometalab@hsr.ch>

RUN apt-get clean && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    parallel \
    osmctools

WORKDIR /home/py

ADD . /home/py/

CMD ./update_size_csv.sh
