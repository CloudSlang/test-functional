#!/bin/bash

# Inputs to this script:
#   - INPUT_FILE_PATH
#   - CLI_EXECUTABLE
#   - TEST_FLOW

echo "Test case started: encoding"

# run CLI with input file
echo "Run CLI with input file: ${INPUT_FILE_PATH}"
CLI_OUPUT=$(${CLI_EXECUTABLE} run --f ${TEST_FLOW} --if ${INPUT_FILE_PATH})
CLI_EXIT_CODE=$?
echo "CLI output:"
echo "${CLI_OUPUT}"
# verify CLI run was successful
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  echo "CLI failed with exit code: ${CLI_EXIT_CODE}"
  exit ${CLI_EXIT_CODE}
fi
# verify UTF-8 text was printed correctly
PRINTED_TEXT=$(echo "${CLI_OUPUT}" | grep 'UTF8_PREFIX_' | sed "s/UTF8_PREFIX_//g")
if [ "${PRINTED_TEXT}" !=  "???èéëïîÿù" ]
then
  echo "Printed text mismatch. Expected: \`???èéëïîÿù\` Actual: \`${PRINTED_TEXT}\`"
  exit 1
fi

echo "Test case finished: encoding"
