SRC = $(wildcard ./*.ipynb)
SHELL=/bin/bash -o pipefail

it: 
	. .venv/bin/activate && nbdev_read_nbs
	. .venv/bin/activate && nbdev_build_lib
	. .venv/bin/activate && nbdev_clean_nbs
	git status

test:
	. .venv/bin/activate && nbdev_test_nbs --n_workers 1

readme:
	. .venv/bin/activate && nbdev_build_docs
	touch docs

clean:
	rm -rf dist

github:
	act -P ubuntu-latest=github_workflow_tester

env:
	virtualenv .venv -p python3.8 --prompt "[$(shell basename "`pwd`")] "
	. .venv/bin/activate && pip install jupyter jupyterlab nbdev
	#. .venv/bin/activate && (jupyter labextension check @jupyter-widgets/jupyterlab-manager ||  jupyter labextension install @jupyter-widgets/jupyterlab-manager)
	. .venv/bin/activate && pip install -e .

server:
	. .venv/bin/activate && jupyter lab --ip 0.0.0.0

keys:
	which jq || (echo "Must have jq installed: sudo apt install -y jq" ; false)
	mkdir -p __deploykeys
	for key in $(shell grep '@git+ssh' settings.ini | sed -n -e 's/^.*\(@git+ssh:\/\/\)//p') ; do \
		fname=__deploykeys/$$( basename $$key ).key && echo $$fname ; \
		aws secretsmanager get-secret-value --secret-id $$key | jq '.SecretString' | tr -d '"' | sed 's/\\n/\n/g' > $$fname && \
		chmod 600 $$fname ; \
	done
