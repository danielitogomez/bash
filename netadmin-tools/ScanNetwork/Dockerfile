FROM alpine:latest

RUN mkdir /script
WORKDIR /script
COPY . /script

RUN apk add --no-cache bash && chmod +x /script/scan-network.sh && apk add nmap --no-cache && /script/scan-network.sh
