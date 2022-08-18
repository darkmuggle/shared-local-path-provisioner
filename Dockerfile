FROM golang:1.16-alpine
RUN apk -U add bash git musl-dev vim less file curl wget ca-certificates jq
COPY . /src
WORKDIR /src
RUN go clean \
 && go build . \
 && mv shared-local-path-provisioner /shared-local-path-provisioner \
 && rm -rf /src

ENTRYPOINT ["/shared-local-path-provisioner"]
