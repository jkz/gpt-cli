#!/usr/bin/env python

from setuptools import setup, find_packages

setup(name='gpt-cli',
      version='1.0',
      packages=find_packages(),
      scripts=["gpt.py"],
     )
