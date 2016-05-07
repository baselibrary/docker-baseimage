NAME     = baselibrary/baseimage
REPO     = git@github.com:baselibrary/docker-baseimage.git
REGISTRY = thoughtworks.io
VERSIONS = $(foreach df,$(wildcard */Dockerfile),$(df:%/Dockerfile=%))

all: build 

build: $(VERSIONS)
	@for version in $(VERSIONS); do \
	docker build --rm --tag=$(NAME):$$version $$version; \
	done

push: $(VERSIONS)
	@for version in $(VERSIONS); do \
	docker tag -f ${NAME}:$$version ${REGISTRY}/${NAME}:$$version; \
	docker push ${REGISTRY}/${NAME}:$$version; \
	docker rmi -f ${REGISTRY}/${NAME}:$$version; \
	done

clean: $(VERSIONS)
	@for version in $(VERSIONS); do \
	docker rmi -f ${NAME}:$$version; \
	docker rmi -f ${REGISTRY}/${NAME}:$$version; \
	done