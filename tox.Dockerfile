FROM themattrix/tox-base
COPY . /app/
WORKDIR /app/
RUN set -ex
CMD tox
