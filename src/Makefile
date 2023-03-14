# Makefile

VENV_NAME := env
PYTHON_VERSION := 3.11
PYTHON_INTERPRETER := python$(PYTHON_VERSION)

.DEFAULT_GOAL := help

# Environment setup
.PHONY: venv
venv:
	$(PYTHON_INTERPRETER) -m venv $(VENV_NAME)

install:
	pip install --upgrade pip
	pip install -r requirements.txt
	pip install -r requirements-dev.txt

# Server
.PHONY: run
run:
	flask run

# Formatting and linting
.PHONY: format
format:
	black .

.PHONY: lint
lint:
	flake8 .

# Testing
.PHONY: test
test:
	pytest
