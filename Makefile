aget-slu:
ifndef VERSION
	$(error VERSION is undefined)
endif
	@make _get-slu OS=darwin ARCH=amd64
	@make _get-slu OS=darwin ARCH=arm64
	@make _get-slu OS=linux ARCH=amd64
	@make _get-slu OS=linux ARCH=arm64
	chmod 755 -R ./bin/*

_get-slu:
ifndef VERSION
	$(error VERSION is undefined)
endif
ifndef OS
	$(error OS is undefined)
endif
ifndef ARCH
	$(error ARCH is undefined)
endif
	install-slu install \
		--bin-dir ./tmp/bin \
		--version $(VERSION) \
		--arch $(ARCH) \
		--os $(OS)
	mv ./tmp/bin/slu bin/slu-$(OS)-$(ARCH)
