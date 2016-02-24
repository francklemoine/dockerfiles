#!/bin/bash

[[ -r ~/.eclipse-env ]] && [[ -a ~/.eclipse-env ]] && . ~/.eclipse-env

exec /opt/eclipse/eclipse

