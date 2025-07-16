README.md: $(wildcard *.tf)
	docker run --rm \
		-v .:/terraform-docs \
		-u $$(id -u) \
		quay.io/terraform-docs/terraform-docs:0.20.0 \
		markdown \
		/terraform-docs \
		> $@
