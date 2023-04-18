PYTHON_VERSION=3.11

build:
	build.sh -e /usr/local -v ${PYTHON_VERSION} --cgal --serializer -i -j 8 --no-root