
.PHONY: check-ci
check-ci:
	docker run \
		--rm \
		--platform linux/amd64 \
		-v $(PROJECT_ROOT_DIR):/src \
		-w /src \
		go-api-builder:latest make check

.PHONY: test-ci
test-ci:
	docker run \
		--rm \
		--platform linux/amd64 \
		-v $(PROJECT_ROOT_DIR):/src \
		-w /src \
		go-api-builder:latest make test

.PHONY: test-integration-ci
test-integration-ci:
	docker run \
		--rm \
		--net host \
		--platform linux/amd64 \
		-v $(PROJECT_ROOT_DIR):/src \
		-w /src \
		go-api-builder:latest make test-integration
