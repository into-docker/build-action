FROM ubuntu:jammy
RUN apt-get update && apt-get install -y curl unzip
RUN mkdir /dist && mkdir -p /var/tmp
COPY download.sh /dist/download.sh
COPY entrypoint.sh /dist/entrypoint.sh

ENV DEFAULT_VERSION="1.1.7"
ENTRYPOINT [ "/dist/entrypoint.sh" ]
