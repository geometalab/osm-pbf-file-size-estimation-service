#!/usr/bin/env python

from __future__ import print_function

import os

from tox.config import parseconfig

TRAVIS_YML_PATH = os.path.join(os.path.dirname(__file__), '.travis.yml')

TRAVIS_YML = """# This is an autogenerated file from tox.ini.
# To update, please run: `python update_travis_config.py`
language: python

cache: pip

sudo: false

addons:
  apt:
    sources:
      - deadsnakes
    packages:
      - python3.5

install:
  - pip install tox

env:
{}

matrix:
  fast_finish: true

install:
  - pip install tox

script:
    - tox -e $TOX_ENV"""


def generate_config_text():
    tox_envs = '\n'.join([" - TOX_ENV={}".format(env) for env in parseconfig('tox').envlist])
    return TRAVIS_YML.format(tox_envs)


if __name__ == '__main__':
    with open(TRAVIS_YML_PATH, 'w') as travis_fd:
        print(generate_config_text(), file=travis_fd)
