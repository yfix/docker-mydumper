#!/bin/bash
set -eu
set -o pipefail

mydumper -B ${ORIGIN_DB_NAME} -o /dumpdir -c -C -e -h ${ORIGIN_DB_HOST} -P ${ORIGIN_DB_PORT} -p ${ORIGIN_DB_PASS} -u ${ORIGIN_DB_USER}
