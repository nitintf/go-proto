
.PHONY: binary
binary:
	@echo "============= Building ==============="
	@mkdir -p $(BIN_DIR)
	CGO_ENABLED=0 go build -ldflags='$(LDFLAGS)' -o $(BIN_DIR) ./cmd/...

.PHONY: clean
clean:
	@echo "============= Cleaning ==============="
	rm -rf "$(BUILD_DIR)"

.PHONY: image
image:
	@echo "============= Creating images ==============="
	docker build -f infra/builder.Dockerfile -t go-api-builder:latest .
	docker run \
		--rm \
		-v $(PROJECT_ROOT_DIR):/src \
		-w /src \
		go-api-builder:latest make clean binary
	docker build -f infra/api.Dockerfile -t go-api:latest .
