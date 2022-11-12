FROM alpine:3.16

RUN apk add --no-cache ca-certificates

COPY /build/bin/api /

RUN GRPC_HEALTH_PROBE_VERSION=v0.4.7 && \
  wget -qO /bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
  chmod +x /bin/grpc_health_probe

ENTRYPOINT ["/api"]
