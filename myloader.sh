#!/usr/bin/env bash
set -eu
set -o pipefail

myloader -d /dumpdir -o -B ${DEST_DB_NAME} -h ${DEST_DB_HOST} -P ${DEST_DB_PORT} -p ${DEST_DB_PASS} -u ${DEST_DB_USER} -C
