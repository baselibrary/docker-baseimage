NAME     = baselibrary/baseimage
REPO     = git@github.com:baselibrary/docker-baseimage.git
VERSIONS = $(foreach df,$(wildcard */Dockerfile),$(df:%/Dockerfile=%))

all: build

build: $(VERSIONS)

release: $(VERSIONS)
	docker push ${NAME}

branches:
	git fetch $(REPO) master
	@$(foreach tag, $(VERSIONS), git branch -f $(tag) FETCH_HEAD;)
	@$(foreach tag, $(VERSIONS), git push $(REPO) $(tag);)
	@$(foreach tag, $(VERSIONS), git branch -D $(tag);)

.PHONY: all build $(VERSIONS)
$(VERSIONS):
	docker build --rm -t $(NAME):$@ $@
