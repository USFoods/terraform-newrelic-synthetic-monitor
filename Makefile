
#############################
# Global vars
#############################
PROJECT_NAME := $(shell basename $(shell pwd))
TFINIT_SCRIPT    ?= ./scripts/tfinit.sh

# Read all subsquent tasks as arguments of the first task
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(args) $(RUN_ARGS):;@:)

#############################
# Targets
#############################
clean:
	@echo "=== $(PROJECT_NAME) === [ clean            ]: removing Terraform local states..."
	@find . \( -name '.terraform*' -or -name '*tfstate*' \) -exec rm -rf {} +

init: exec
	@echo "=== $(PROJECT_NAME) === [ init             ]: initializing Terraform configuration..."
	@$(TFINIT_SCRIPT)
	@echo "=== $(PROJECT_NAME) === [ init             ]: initializing tflint configuration..."
	@tflint --init

fmt:
	@echo "=== $(PROJECT_NAME) === [ format           ]: formatting Terraform configuration..."
	@terraform fmt --recursive

lint:
	@echo "=== $(PROJECT_NAME) === [ lint             ]: linting Terraform configuration..."
	@tflint --recursive

deps:
	@echo "=== $(PROJECT_NAME) === [ deps             ]: downloading development dependencies..."
	@go mod tidy

exec: 
	@echo "=== $(PROJECT_NAME) === [ exec             ]: making scripts executable..."
	@chmod +x $(TFINIT_SCRIPT)

ready: fmt lint clean

.PHONY : clean lint init deps exec fmt ready
