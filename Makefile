.SECONDEXPANSION:

MODULES=$(dir $(shell find -name main.tf))

readme: $(addsuffix README.md,$(MODULES))

%/README.md: $$(wildcard %/*.tf)
	docker run --rm \
		-v ./$*:/terraform-docs \
		-u $(shell id -u) \
		quay.io/terraform-docs/terraform-docs:0.20.0 \
		markdown \
		/terraform-docs \
		> $@
