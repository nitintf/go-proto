
.PHONY: test
test:
	@echo "============= Running unit tests ==============="
	go test -cover -coverprofile=coverage.txt -timeout 60s -race -v -short ./...

.PHONY: test-integration
test-integration:
	@echo "============= Running integration tests ==============="
	go test -cover -coverpkg ./pkg/... -coverprofile=coverage.txt -timeout 5m -race -count 1 -v -tags=integration ./test
