SHELL:=bash
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help install
.DEFAULT_GOAL:=help

install: ## resolve all the requirements
	ANSIBLE_ROLES_PATH=$$ROOT_DIR/roles
	mkdir -p $$ANSIBLE_ROLES_PATH
	ansible-galaxy install -r requirements.yml

help:
	@grep -h -P '^[a-zA-Z0-9_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
