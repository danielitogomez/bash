FROM alpine:latest

RUN mkdir /script
WORKDIR /script
COPY CIDR-to-netmask.sh /script

RUN apk add --no-cache bash && chmod +x /script/CIDR-to-netmask.sh
ENTRYPOINT ["/script/CIDR-to-netmask.sh"]
