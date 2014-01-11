FLAGS := --verbose --show_diff
MODDULE_PATH := ./modules
MANIFEST := manifests/site.pp

noop:
	@puppet apply $(FLAGS) --noop --modulepath $(MODDULE_PATH) $(MANIFEST)

run:
	@puppet apply $(FLAGS) --modulepath $(MODDULE_PATH) $(MANIFEST)

validate:
	@find . -name '*.pp' | xargs puppet parser validate

update:
	@git submodule update --init --recursive
