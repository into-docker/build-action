FROM busybox:glibc
ARG DEFAULT_VERSION="1.0.0-RC6"

RUN mkdir /dist && mkdir -p /var/tmp
COPY download.sh /dist/download.sh
RUN /dist/download.sh "${DEFAULT_VERSION}"

COPY entrypoint.sh /dist/entrypoint.sh
ENTRYPOINT [ "/dist/entrypoint.sh" ]
