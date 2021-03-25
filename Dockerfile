FROM busybox:glibc
RUN mkdir /dist && mkdir -p /var/tmp
COPY download.sh /dist/download.sh
COPY entrypoint.sh /dist/entrypoint.sh

ENV DEFAULT_VERSION="1.0.0"
ENTRYPOINT [ "/dist/entrypoint.sh" ]
