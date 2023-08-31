PYTHON_VERSION=3.11
cpus = 5
# 	BUILD_JOBS:=$(cpus)

.PHONY: build

build:
	./build.sh -e /usr/local -v ${PYTHON_VERSION} --cgal --serializer -i -j 8 --no-root

bump-upload:
	$(MAKE) bump
	$(MAKE) upload

bump:
	bumpversion patch

upload:
	git push --tags
	git push
	rm -f dist/*
	rm -rf *.egg-info
	python setup.py sdist
	twine upload dist/*