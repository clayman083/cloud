.PHONY:

install-python:
	poetry install

install-roles:
	poetry run ansible-galaxy install -r requirements.yml

install: install-python install-roles
