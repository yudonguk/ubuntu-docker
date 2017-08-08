
FROM ubuntu:14.04.5

RUN apt-get update \
  && apt-get install -yq build-essential python3 \
  && mkdir cmake-build && cd cmake-build \
  && apt-get install -yq curl libcurl4-openssl-dev \
  && curl -OLs https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz && tar -xf cmake-3.8.2.tar.gz \
  && cd cmake-3.8.2 && ./bootstrap --system-curl && make install && cd .. \
  && cd .. && rm -rf cmake-build \
  && apt-get -yq upgrade \
  && apt-get autoremove \
  && apt-get clean

CMD ["/bin/bash"]
