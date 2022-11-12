FROM golang:1.19-alpine3.16 as builder

ARG SRC_DIR=/src

# build-base installs make, gcc (needed for -race tests), etc.
RUN apk add --no-cache git build-base

# see https://github.blog/2022-04-12-git-security-vulnerability-announced/
RUN git config --global --add safe.directory $SRC_DIR
