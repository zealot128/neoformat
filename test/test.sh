#!/usr/bin/env bash

if ! hash vint 2>/dev/null; then
    pip install vint
fi

vint .
