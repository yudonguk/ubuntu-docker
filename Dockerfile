
FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yq build-essential cmake python3 autoconf libtool pkg-config libboost-all-dev \
  && apt-get -yq upgrade \
  && apt-get autoremove \
  && apt-get clean

CMD ["/bin/bash"]
