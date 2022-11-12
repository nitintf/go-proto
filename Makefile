BUF_IMG = bufbuild/buf:1.9.0

PROJECT_ROOT_DIR := $(shell git rev-parse --show-toplevel)

GIT_SHA1 = $(shell git describe --match 'v[0-9]*' --tags --always)
VERSION = $(GIT_SHA1)
LDFLAGS = -s -X main.version=$(GIT_SHA1)

REGISTRY := gcr.io/cruise-gcr-dev
DEV_REGISTRY := gcr.io/cruise-gcr-dev
PROD_REGISTRY := gcr.io/cruise-gcr-prod

ENV := local

BUILD_DIR := $(PROJECT_ROOT_DIR)/build
BIN_DIR := $(BUILD_DIR)/bin

# Help
.PHONY: default
default:
	@echo "Please specify a build target. The choices are:"
	@echo "    binary:             Create Go binaries"
	@echo "    check:              Run lint checks"
	@echo "    clean:              Clean build directory"
	@echo "    compose-up:         Start the service locally using docker-compose"
	@echo "    gomod:              Run go mod and related targets"
	@echo "    image:              Create Docker image"
	@echo "    protoc:             Compile proto schema/interface"
	@echo "    release             Initiate a release"
	@echo "    test:               Run unit tests"
	@echo "    test-integration:   Run integration tests"
	@false

include mk/build.mk
include mk/compose.mk
include mk/proto.mk
include mk/dev.mk
include mk/ci.mk
include mk/test.mk
include mk/validate.mk
include mk/release.mk

.PHONY: gomod
gomod:
	go mod tidy -compat=1.19
	go mod vendor
