FROM alpine:latest


RUN apk update \
&& apk add vsftpd openssl bash openrc

COPY srcs /root/

WORKDIR /root

VOLUME [ “/sys/fs/cgroup” ]

EXPOSE 21

ENTRYPOINT sh entrypoint.sh
