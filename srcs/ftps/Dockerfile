FROM alpine:3.12.3

VOLUME [ “/sys/fs/cgroup” ]

RUN apk update \
&& apk add vsftpd openssl bash vim

COPY srcs /root/

WORKDIR /root

ENTRYPOINT sh entrypoint.sh
