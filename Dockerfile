FROM golang:1.22 AS builder

ENV GOPATH=/usr/local
ENV VC_VER=0.0.2

RUN wget https://github.com/teslamotors/vehicle-command/archive/refs/tags/v${VC_VER}.tar.gz && \
    tar zxf v${VC_VER}.tar.gz && \
    cd vehicle-command-${VC_VER} && \
    go get ./... && \
    go build ./... && \
    go install ./...

FROM golang:1.22

COPY --from=builder /usr/local/bin/tesla-http-proxy /usr/local/bin/tesla-http-proxy
COPY startproxy.sh /usr/local/bin/startproxy.sh

EXPOSE 443

ENTRYPOINT [ "/usr/local/bin/startproxy.sh" ]
