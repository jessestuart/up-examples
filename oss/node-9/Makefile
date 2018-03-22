LATEST = "$(shell fetch_latest_version.sh)"

.PHONY: default
default:
ifeq (,$(wildcard node-$(LATEST)-linux-x64))
	@echo "Pulling latest NodeJS release: $(LATEST)"
	@curl -sL https://nodejs.org/dist/${LATEST}/node-${LATEST}-linux-x64.tar.gz | tar -xz
	@ln -sf ./node-${LATEST}-linux-x64/bin/node ./node_latest
endif

.PHONY: clean
clean:
	@rm -rf node-v*-linux-x64
