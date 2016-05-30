#!/bin/bash

# Inputs to this script:
#   - BUILDER_EXECUTABLE
#   - TEST_PARENT: dir that contains `content` and `test`
#   - PASSWORD_INPUT_VALUE
#   - LOG_FILE_PATH

CS_TEMP_FILE_PATH='cs_temp.txt'

echo "Test case started: sensitive"

# run builder
echo "Running builder"
${BUILDER_EXECUTABLE} ${TEST_PARENT} -ts !default,sensitive
BUILDER_EXIT_CODE=$?
if [ "${BUILDER_EXIT_CODE}" !=  "0" ]
then
  exit ${BUILDER_EXIT_CODE}
fi

# verify password does not appear in logs
grep -R ${PASSWORD_INPUT_VALUE} ${LOG_FILE_PATH} > ${CS_TEMP_FILE_PATH}
PASSWORD_SEARCH_RESULT=$(cat ${CS_TEMP_FILE_PATH})
if [[ ${PASSWORD_SEARCH_RESULT} = *[![:space:]]* ]]
then
  echo "Password search result is not empty"
    exit 1
fi

echo "Test case finished: sensitive"
