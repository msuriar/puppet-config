validate:
	@find . -name '*.pp' | xargs puppet parser validate
update:
	@git submodule update --init --recursive
