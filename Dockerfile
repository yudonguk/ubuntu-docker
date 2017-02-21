
FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -yq build-essential cmake python3 \
  && apt-get -yq upgrade \
  && apt-get autoremove \
  && apt-get clean

CMD ["/bin/bash"]
