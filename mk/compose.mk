
.PHONY: compose-up
compose-up: image compose-up-no-rebuild

compose-down:
		echo "============= Stopping Api Services ==============="
		docker-compose -f infra/docker-compose.yml down


.PHONY: compose-up-no-rebuild
compose-up-no-rebuild: 
	echo "============= Starting Api Services ==============="
	docker-compose -f infra/docker-compose.yml down >/dev/null 2>&1
	docker-compose -f infra/docker-compose.yml up -d

.PHONY: compose-ps
compose-ps:
	docker-compose -f infra/temporal/docker-compose.yml ps
