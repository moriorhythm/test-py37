#!/bin/bash

set -Cu

# ./create_log.sh /task/logs test.log
# -> create /task/logs/001_test.log
create_log() {
  _usage_exit() {
    echo "create_log [LOG_DIR] [LOG_FILE_PREFIX]"
    exit 1
  }
  _check_dir() {
    local reg='^.*\/$'
    if [[ $1 =~ ${reg} ]]; then
      echo "末尾に「/」を付けないでください"
      _usage_exit
    fi
    if [ ! -e $1 ]; then
      mkdir -p "$1"
    fi
    return
  }
  _check_prefix() {
    local reg='^.*\.log$'
    if [[ ! $1 =~ ${reg} ]]; then
      echo "末尾は「.log」にしてください"
      _usage_exit
    fi
    return
  }

  if [ $# -eq 2 ]; then
    local dir_name=$1
    local file_prefix=$2

    _check_dir $1
    _check_prefix $2

    local cnt=$(ls ${dir_name} | wc -l)
    let cnt++
    local seq_cnt=$(seq -f %03g ${cnt} | tail -n 1)
    local file_name=${seq_cnt}_${file_prefix}
    echo ${file_name}
  else 
    _usage_exit
  fi
  unset _check_prefix
  unset _check_dir
  unset _usage_exit
}