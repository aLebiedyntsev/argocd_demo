SHELL := /bin/bash

.PHONY:

check-environment:
ifndef ENVIRONMENT
	@echo "ENVIRONMENT is not set"
	@exit 1
endif



dependencies: check-environment
	cd "./environments/${ENVIRONMENT}" && helmfile deps

manifest: check-environment
	cd "./environments/${ENVIRONMENT}" && helmfile template > ./manifest.yaml

sync: check-environment manifest
	cd "./environments/${ENVIRONMENT}" && helmfile sync
