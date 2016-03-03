#!/bin/bash

# Preconditions:
#   precond_1: CLI log folder is created (with execution.log)

# Inputs to this script:
#   - LOG4J_DIR: <configuration/logging>
#   - APP_HOME: home to bin folder
#   - RESOURCES_FOLDER
#   - CLI_EXECUTABLE
#   - CLI_CONTENT

echo "Test case started: log4j"

# backup current log4j file
echo "Backup current log4j file: ${LOG4J_DIR}/log4j.properties -> ${LOG4J_DIR}/log4j_backup.properties"
mv ${LOG4J_DIR}/log4j.properties ${LOG4J_DIR}/log4j_backup.properties
# rename current logging folder - <precond_1>
echo "Rename current logging folder: ${APP_HOME}/logs -> ${APP_HOME}/logs_backup"
mv ${APP_HOME}/logs ${APP_HOME}/logs_backup
# copy new log4j file
echo "Copy new log4j file: ${RESOURCES_FOLDER}/log4j.properties -> ${LOG4J_DIR}/log4j.properties"
cp -pv ${RESOURCES_FOLDER}/log4j.properties ${LOG4J_DIR}/log4j.properties
# run CLI
echo "Running the CLI"
${CLI_EXECUTABLE} run --f ${CLI_CONTENT}/io/cloudslang/base/print/print_text.sl --i text=testing_log_folder
# validate new logging folder is correct
echo "Validating logging folders are correct"
if [ ! -d "${APP_HOME}/logs_user_config" ]
then
  echo "Directory ${APP_HOME}/logs_user_config does not exist"
  exit 1
fi
if [ -d "${APP_HOME}/logs" ]
then
  echo "Directory ${APP_HOME}/logs exists"
  exit 1
fi
# remove new logging folder
echo "Remove new logging folder: ${APP_HOME}/logs_user_config"
rm -r ${APP_HOME}/logs_user_config
# restore old logging folder
echo "Restore old logging folder: ${APP_HOME}/logs_backup ->  ${APP_HOME}/logs"
mv ${APP_HOME}/logs_backup  ${APP_HOME}/logs
# restore old log4j file
echo "Restore old log4j file: ${LOG4J_DIR}/log4j_backup.properties -> ${LOG4J_DIR}/log4j.properties"
mv ${LOG4J_DIR}/log4j_backup.properties ${LOG4J_DIR}/log4j.properties

echo "Test case finished: log4j"
