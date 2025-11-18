# Makefile for demo1 project
# This project uses pnpm and turbo for package management and building

# Default target
.PHONY: help
help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Installation
.PHONY: install
install: ## Install dependencies
	pnpm install

# Development
.PHONY: dev
dev: ## Start development server
	pnpm dev

# Building
.PHONY: build
build: ## Build the project
	pnpm build

# Testing
.PHONY: test
test: ## Run tests
	pnpm test

.PHONY: test-watch
test-watch: ## Run tests in watch mode
	pnpm test:watch

# Code quality
.PHONY: lint
lint: ## Run linting
	pnpm lint

.PHONY: lint-fix
lint-fix: ## Fix linting issues
	pnpm lint:fix

.PHONY: format
format: ## Format code
	pnpm format

.PHONY: format-check
format-check: ## Check code formatting
	pnpm format:check

.PHONY: type-check
type-check: ## Run type checking
	pnpm type-check

# Cleaning
.PHONY: clean
clean: ## Clean build artifacts
	pnpm clean

.PHONY: clean-all
clean-all: ## Clean all artifacts including dependencies
	pnpm clean
	rm -rf node_modules
	rm -rf pnpm-lock.yaml

# Turbo specific commands
.PHONY: turbo-build
turbo-build: ## Build using turbo
	turbo build

.PHONY: turbo-test
turbo-test: ## Test using turbo
	turbo test

.PHONY: turbo-lint
turbo-lint: ## Lint using turbo
	turbo lint

.PHONY: turbo-clean
turbo-clean: ## Clean using turbo
	turbo clean

# Workspace management
.PHONY: ws-install
ws-install: ## Install dependencies for all workspace packages
	pnpm -r install

.PHONY: ws-build
ws-build: ## Build all workspace packages
	pnpm -r build

.PHONY: ws-test
ws-test: ## Test all workspace packages
	pnpm -r test

.PHONY: ws-lint
ws-lint: ## Lint all workspace packages
	pnpm -r lint

# CI/CD helpers
.PHONY: ci
ci: ## Run CI pipeline (install, lint, type-check, test, build)
	pnpm install
	pnpm lint
	pnpm type-check
	pnpm test
	pnpm build

.PHONY: pre-commit
pre-commit: lint format type-check ## Run pre-commit checks

# Documentation
.PHONY: docs
docs: ## Generate documentation
	pnpm docs

.PHONY: docs-serve
docs-serve: ## Serve documentation locally
	pnpm docs:serve

# Release
.PHONY: version
version: ## Bump version
	pnpm version

.PHONY: publish
publish: build ## Publish to npm
	pnpm publish

# Development utilities
.PHONY: watch
watch: ## Watch for changes and rebuild
	pnpm watch

.PHONY: watch:tsc
watch:tsc: ## Watch TypeScript compilation
	turbo watch:tsc

# Setup
.PHONY: setup
setup: install ## Initial project setup
	@echo "Project setup complete!"

# Default target
.DEFAULT_GOAL := help