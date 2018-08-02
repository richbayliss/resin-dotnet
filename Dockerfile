FROM resin/armv7hf-debian

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install -y curl libunwind8 gettext icu-devtools

RUN rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin

WORKDIR /tmp

ARG DOTNET_BUNDLE
ENV DOTNET_BUNDLE=${DOTNET_BUNDLE}

RUN curl -sSL -o dotnet.tar.gz ${DOTNET_BUNDLE}

RUN mkdir -p /opt/dotnet && \
    tar zxf dotnet.tar.gz -C /opt/dotnet && \
    ln -s /opt/dotnet/dotnet /usr/local/bin

RUN rm -rf /tmp/*

RUN [ "cross-build-end" ]

WORKDIR /app

CMD [ "dotnet", "--help" ]
