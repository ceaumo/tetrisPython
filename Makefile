mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
SHELL := /bin/bash

init:
	( \
       	export WORKON_HOME=$$HOME/.virtualenvs; \
		source /usr/local/bin/virtualenvwrapper.sh; \
		rmvirtualenv $(current_dir); \
		mkvirtualenv $(current_dir); \
		source $$HOME/.virtualenvs/$(current_dir)/bin/activate; \
		pip3 install -U pip; \
		pip3 install -r requirements.txt; \
    )


clean:
	rm -rf .vscode .idea 
