FROM ubuntu:18.04

# Install prerequisites
 #- sudo apt-get update && sudo apt-get install libre2-dev libtclap-dev liblmdb-dev
 # - mkdir build
 # - cmake ..
 # - make 

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    liblog4cplus-dev \
    libre2-dev \ 
    libtclap-dev \
    liblmdb-dev

# Copy all data
COPY . /srv/rollingdb

# Setup the build directory
RUN mkdir /srv/rollingdb/src/build
WORKDIR /srv/rollingdb/src/build

# Setup the compile environment
RUN cmake ../../ && \
    make && \
    make install

#WORKDIR /data

ENTRYPOINT ["/srv/rollingdb/src/build/rdb_read"]