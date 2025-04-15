.PHONY: all
all: build

.PHONY: build
build:
	npm run build

.PHONY: check pack
check pack: build
	npm pack

.PHONY: publish
publish: build
	npm publish
