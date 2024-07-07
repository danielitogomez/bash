# Use the latest Alpine image as the base
FROM alpine:latest

# Set the working directory
WORKDIR /script

# Copy the target scan script and targets file into the container
COPY target-scan.sh .
COPY targets.txt .

# Install necessary packages in one layer and clean up to keep the image small
RUN apk update && \
    apk add --no-cache \
    bash \
    nmap \
    nmap-scripts && \
    chmod +x /script/target-scan.sh && \
    rm -rf /var/cache/apk/*

# Set the entry point to the target scan script
ENTRYPOINT ["/script/target-scan.sh"]
