# Use the Ubuntu 14.04 LTS image from the official Docker repository
FROM ubuntu:14.04

# Install any necessary dependencies for your OTServer
# For example, if you need a specific version of MySQL or PostgreSQL client libraries

RUN apt-get update \
    && apt-get install -y \        
        liblua5.1-0-dev \
        autoconf \
        libboost-all-dev \
        libgmp-dev \
        liblua5.1-0 \
        liblua5.1-0-dev \
        liblua50 \
        liblua50-dev \
        liblualib50 \
        liblualib50-dev \
        lua50 \
        lua5.1 \
        libxml2-dev \
        libxml++2.6-dev \
        libmysql++-dev \
        libsqlite0-dev \
        libsqlite3-dev \
        build-essential

# Copy the OTServer files to the container's /otserver directory
COPY ./NTOHeroes_server /otserver
WORKDIR /otserver
RUN chmod -R 777 /otserver

# Expose any required ports for your OTServer (e.g., game port, website port)
EXPOSE 7171
EXPOSE 80

# Define the entry point command to start your OTServer
# Replace "start_command" with the actual command to start your server
# For example: CMD ["./your_otserver_binary", "parameters"]
CMD ["./theotxserver"]