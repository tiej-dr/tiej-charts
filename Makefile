CLUSTER_NAME="k3s"

up: create bootstrap

down: delete

create:
	k3d cluster create $(CLUSTER_NAME)

delete:
	k3d cluster delete $(CLUSTER_NAME)


bootstrap:
	@./scripts/bootstrap.sh $(CLUSTER_NAME)

