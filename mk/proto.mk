.PHONY: protoc
protoc:
	@echo "============= Generating Api protos ==============="
	docker run --platform linux/amd64 --rm -v `pwd`:/repo -w "/repo" $(BUF_IMG) generate
