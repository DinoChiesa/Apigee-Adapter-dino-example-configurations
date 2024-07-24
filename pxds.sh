#!/bin/bash
# -*- mode:shell-script; coding:utf-8; -*-
#
# Created: <Tue Sep 13 16:31:32 2022>
# Last Updated: <2022-September-14 10:46:08>
#
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

[[ -z "$1" ]] && printf "specify a config" && exit 1
[[ ! -f "$1" ]] && printf "the config must exist" && exit 1
config=$1

firstThree=${config:0:3}

[[ "$firstThree" != "lds" && "$firstThree" != "cds" ]] && printf "the target must be lds or cds" && exit 1

cp $scriptdir/$config $scriptdir/STAGING.yaml
mv $scriptdir/STAGING.yaml ${firstThree}.yaml
