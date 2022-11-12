
.PHONY: check
check: vet check-workflow check-proto

.PHONY: vet
vet:
	@echo "============= Running 'go vet' ==============="
	go vet ./...

.PHONY: check-proto
check-proto: check-proto-lint check-proto-breaking

.PHONY: check-proto-lint
check-proto-lint:
	@echo "============= Running proto lint ==============="
	docker run --platform linux/amd64 --rm -v `pwd`:/repo -w "/repo" $(BUF_IMG) lint


.PHONY: check-proto-breaking
check-proto-breaking:
	@echo "============= Checking for proto breaking changes ==============="
	docker run --platform linux/amd64 --rm -v `pwd`:/repo -w "/repo" $(BUF_IMG) breaking --against ".git#branch=master"
