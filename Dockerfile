FROM ubuntu:xenial

ARG FLOW_VERSION=0.30.0

RUN apt-get update \
    && apt-get install -y \
        curl \
        libelf1 \
        rsync \
        unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -SL "https://github.com/facebook/flow/releases/download/v${FLOW_VERSION}/flow-linux64-v${FLOW_VERSION}.zip" -o "flow-linux64-v${FLOW_VERSION}.zip" \
    && unzip "flow-linux64-v${FLOW_VERSION}.zip" -d /usr/local \
    && rm "flow-linux64-v${FLOW_VERSION}.zip"

ENV PATH /usr/local/flow:$PATH

VOLUME /usr/src/app
WORKDIR /usr/src/app

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD /usr/local/bin/run.sh
