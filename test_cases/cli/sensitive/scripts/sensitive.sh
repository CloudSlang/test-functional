#!/bin/bash

# Inputs to this script:
#   - CLI_EXECUTABLE
#   - TEST_FLOW_PATH
#   - CONTENT_CLASSPATH
#   - INPUTS_FILE_PATH
#   - PASSWORD_INPUT_VALUE
#   - LOG_FILE_PATH

CS_TEMP_FILE_PATH='cs_temp.txt'

echo "Test case started: sensitive"

# run flow
echo "Running test flow"
${CLI_EXECUTABLE} run --f ${TEST_FLOW_PATH} --cp ${CONTENT_CLASSPATH} --if ${INPUTS_FILE_PATH}
CLI_EXIT_CODE=$?
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  exit ${CLI_EXIT_CODE}
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
