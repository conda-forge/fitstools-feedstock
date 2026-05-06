#!/bin/bash

# Force C++14 because this codebase uses dynamic exception specifications
# (throw(...)) that are rejected under modern compiler defaults (C++17+).
# We do this (instead of downgrading the compiler) to avoid ABI compatibility issues.
# See:
# - https://github.com/conda/conda-build/issues/3097
# - https://stackoverflow.com/a/49119902/2427624
CXXFLAGS="${CXXFLAGS} -std=gnu++14 -fpermissive"

./configure --prefix=${PREFIX} --with-ltl=${PREFIX} --with-libjpeg=${PREFIX}
make
make install
