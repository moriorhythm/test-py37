#!/bin/bash

set -Cuo pipefail

source "$(cd $(dirname $0); pwd)/config/env"
source "$(cd $(dirname $0); pwd)/libs/create_log.sh"

BATCH_DIR=$(cd $(dirname $0); pwd)
BATCH_NAME="test_py37"

DATE_YYYYMMDD_HHMMSS_NNN=$(date +"%Y%m%d_%H%M%S_%3N")

LOG_DIR="${BATCH_DIR}/logs"
LOG_FILE_NAME="$(create_log ${LOG_DIR} ${DATE_YYYYMMDD_HHMMSS_NNN}.log)"
LOG_FILE_PATH="${LOG_DIR}/${LOG_FILE_NAME}"

# ディレクトリ作成
if [ ! -e "${LOG_DIR}" ]; then
  mkdir -p "${LOG_DIR}"
fi

echo "This is test." | tee -a ${LOG_FILE_PATH}
