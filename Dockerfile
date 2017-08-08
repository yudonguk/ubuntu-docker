
FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -yq build-essential cmake python3 curl autoconf libtool pkg-config \
  && apt-get -yq upgrade \
  && apt-get autoremove \
  && apt-get clean

RUN XENOMAI_NAME="xenomai-3.0.3" \
  && curl -OLs https://git.kangwon.ac.kr/iic/xenomai-archive/raw/master/archive/${XENOMAI_NAME}.tar.bz2 \
  && tar -xf ${XENOMAI_NAME}.tar.bz2 \
  && cd ${XENOMAI_NAME} \
  && ./scripts/bootstrap \
  && ./configure –-with-core=mercury --enable-pshared \
  && make install \
  && cd .. \
  && rm -rf ${XENOMAI_NAME}

CMD ["/bin/bash"]
