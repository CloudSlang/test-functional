#!/bin/bash

# Inputs to this script:
#   - INPUTS_TARGET_DIR: <parent_path_to_inputs>
#   - INPUTS_SRC_DIR: <parent_path_to_inputs>
#   - INPUTS_FOLDER_NAME: inputs
#   - CLI_EXECUTABLE: path
#   - TEST_FLOW: path

echo "Test case started: inputs_folder"

INPUTS_SRC_DIR_FULL_PATH=${INPUTS_SRC_DIR}/${INPUTS_FOLDER_NAME}
INPUTS_TARGET_DIR_FULL_PATH=${INPUTS_TARGET_DIR}/${INPUTS_FOLDER_NAME}

# copy input files
echo "Copying input files ${INPUTS_SRC_DIR_FULL_PATH} -> ${INPUTS_TARGET_DIR}"
mkdir -p ${INPUTS_TARGET_DIR}
cp -avr ${INPUTS_SRC_DIR_FULL_PATH} ${INPUTS_TARGET_DIR}

# run flow
echo "Running test flow"
${CLI_EXECUTABLE} run --f ${TEST_FLOW}
CLI_EXIT_CODE=$?
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  exit ${CLI_EXIT_CODE}
fi

# delete input files
echo "Removing inputs folder: ${INPUTS_TARGET_DIR_FULL_PATH}"
rm -r ${INPUTS_TARGET_DIR_FULL_PATH}

echo "Test case finished: inputs_folder"
