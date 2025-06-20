FROM debian:bookworm-slim

USER root 

ARG flutter_version

ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=$flutter_version
ENV FLUTTER_ROOT=$FLUTTER_HOME

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    unzip \
    xz-utils \
    bash \
    sudo \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates 

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN git clone --depth 1 --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}


RUN chown -R root:root ${FLUTTER_HOME}

RUN flutter doctor
