#!/usr/bin/env bash
if type -p minishift > /dev/null
then
    eval "$(minishift oc-env)"
fi
