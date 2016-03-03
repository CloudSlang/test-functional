#!/bin/bash

# Inputs to this script:
#   - PROPS_TARGET_DIR: <parent_path_to_properties>
#   - PROPS_SRC_DIR: <path>/properties
#   - CLI_EXECUTABLE: path
#   - TEST_FLOW: path

echo "Test case started: properties_folder"

# copy property files
echo "Copying property files ${PROPS_SRC_DIR} -> ${PROPS_TARGET_DIR}"
mkdir -p ${PROPS_TARGET_DIR}
cp -avr ${PROPS_SRC_DIR} ${PROPS_TARGET_DIR}

# run flow
echo "Running test flow"
${CLI_EXECUTABLE} run --f ${TEST_FLOW}
CLI_EXIT_CODE=$?
if [ "${CLI_EXIT_CODE}" !=  "0" ]
then
  exit ${CLI_EXIT_CODE}
fi

# delete property files
echo "Removing properties folder: ${PROPS_TARGET_DIR}"
rm -r ${PROPS_TARGET_DIR}

echo "Test case finished: properties_folder"
