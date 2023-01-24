#!/bin/bash

CY=/scratch/joonho.whangbo/coding/chipyard
CONDA=${CY}/.conda-env
MARSHAL=${CY}/software/firemarshal/marshal

function set_ulimit {
  ulimit -Sn $(ulimit -Hn)
  echo $(ulimit -Sn)
}

function marshal_build {
  if [ $# -eq 0 ]
  then
    echo "Usage: ./marshal-build.sh <name>"
    exit 1
  fi

  unset MARSHAL_BOARD_DIR

  set_ulimit

  conda run -p ${CONDA} ${MARSHAL} build $1.yaml
}

marshal_build $1
