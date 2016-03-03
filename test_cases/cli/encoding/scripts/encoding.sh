#!/bin/bash

# Inputs to this script:
#   - INPUT_FILE_PATH
#   - CLI_EXECUTABLE
#   - TEST_FLOW

echo "Test case started: encoding"

# run CLI with input file
echo "Run CLI with input file: ${INPUT_FILE_PATH}"
${CLI_EXECUTABLE} run --f ${TEST_FLOW} --if ${INPUT_FILE_PATH}
CLI_EXIT_CODE=$?
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  echo "CLI failed with exit code: ${CLI_EXIT_CODE}"
  exit ${CLI_EXIT_CODE}
fi

echo "Test case finished: encoding"
