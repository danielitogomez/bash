FROM alpine:latest

RUN mkdir /script
WORKDIR /script
COPY . /script

RUN apk add --no-cache bash && chmod +x /script/network-scan.sh && apk add nmap --no-cache

ENTRYPOINT ["/script/network-scan.sh"]
