# This Dockerfile builds on golang:alpine by building Kubernetes Operator SDK 
# from source using the current working directory.
# This produces a docker image that contains a working Operator SDK CLI
 
FROM golang:alpine
MAINTAINER "DavidLi <dav1dli@netscape.net>"

ENV SDK_VERSION=master

RUN apk add --update git bash openssh curl make

WORKDIR $GOPATH/src/github.com/operator-framework
RUN cd $GOPATH/src/github.com/operator-framework && \
    git clone https://github.com/operator-framework/operator-sdk && \
    cd operator-sdk && \
    git checkout ${SDK_VERSION} && \
    make install && \ 
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR $GOPATH
ENTRYPOINT ["operator-sdk"]
