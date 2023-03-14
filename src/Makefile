# Makefile

VENV_NAME := env
PYTHON_VERSION := 3.11
PYTHON_INTERPRETER := python$(PYTHON_VERSION)

.DEFAULT_GOAL := help

.PHONY: check-python

check-python:
    @python3.11 --version >/dev/null 2>&1 || { echo >&2 "Python 3.11 is required but not installed. Aborting."; exit 1; }


# Environment setup
.PHONY: venv
venv:
	$(PYTHON_INTERPRETER) -m venv $(VENV_NAME)

install: check-python
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
