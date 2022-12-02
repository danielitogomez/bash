FROM alpine:latest

WORKDIR /script
COPY network-scan.sh .

RUN apk add --no-cache bash && chmod +x /script/network-scan.sh && apk add nmap --no-cache && apk add nmap-scripts

ENTRYPOINT ["/script/network-scan.sh"]
