<div class="badges">
    <a href="http://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service">
        <img src="https://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service.svg?branch=master">
    </a>
    <a href="https://pypi.python.org/pypi/geometalab.osm-pbf-file-size-estimation-service">
        <img src="https://img.shields.io/pypi/v/geometalab.osm-pbf-file-size-estimation-service.svg">
    </a>
</div>

---

# geometalab.osm-pbf-file-size-estimation-service

Rough estimate for a certain extent for pbf file size.

---

## Overview

Rough estimate for a certain extent for pbf file size.

## Requirements

* Python (3.7, 3.8, 3.9)
* Django (2, 3)

## Installation

Install using `pip`...

```bash
pip install geometalab.osm-pbf-file-size-estimation-service
```

## Example

TODO: Write example.

## Testing

Install testing requirements.

```bash
poetry install
```

Run with runtests.

```bash
poetry run ./runtests.py
```

You can also use the excellent [tox](http://tox.readthedocs.org/en/latest/) testing tool to run the tests against all supported versions of Python and Django. Install the python interpreters (3.7, 3.9), and then simply run:

```bash
poetry run tox
```

Alternatively using docker:
```bash
./tox_run.sh
```

## Documentation

To build the documentation, you'll need to install the depenencies, using poetry:

```bash
poetry install
```

To preview the documentation:

```bash
poetry run mkdocs serve
Running at: http://127.0.0.1:8000/
```

To build the documentation:

```bash
poetry run mkdocs build
```

## Publish/Build

To publish a new release:

* change the version in pyproject.toml

then build:

```bash
poetry build
```

and publish:

```bash
poetry publish
```

and tag it:
```bash
git tag -a <version> -m "new release <version>"
git push
```
