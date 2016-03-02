#!/bin/bash

# Inputs to this script:
#   - INPUTS_TARGET_DIR <path>/inputs
#   - INPUTS_SRC_DIR <path>/inputs
#   - CLI_EXECUTABLE
#   - TEST_FLOW

echo "Test case started: inputs_folder"

# copy input files
echo "Copying input files ${INPUTS_SRC_DIR} -> ${INPUTS_TARGET_DIR}"
mkdir -p ${INPUTS_TARGET_DIR}
cp -avr ${INPUTS_TARGET_DIR} ${INPUTS_SRC_DIR}

# run flow
echo "Running test flow"
${CLI_EXECUTABLE} run --f ${TEST_FLOW}
CLI_EXIT_CODE=$?
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  exit ${CLI_EXIT_CODE}
fi

# delete input files
echo "Removing inputs folder: ${INPUTS_TARGET_DIR}"
rm -r ${INPUTS_TARGET_DIR}

echo "Test case finished: inputs_folder"
