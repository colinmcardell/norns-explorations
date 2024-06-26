#!/bin/bash

# This script can be sourced by other scripts to allow validation the
# environment variables in the `.env.development` file.

# Function to validate environment variables in .env.development file
validate_env_variables() {
  # Check that the `env.development` file exists
  if [ ! -f .env.development ]; then
    echo -e "${BRED}${TASK_NAME} - error: the .env.development file does not exist. please create it and add the necessary environment variables${NC}"
    exit 1
  fi

  # Validate that `env.development` contains the necessary environment variables
  required_vars=("NORNS_USER" "NORNS_HOST" "NORNS_PASSWORD" "SCRIPT_NAME" "DESTINATION_PATH" "EXCLUDES")

  for var in "${required_vars[@]}"; do
    if ! grep -q "${var}=" .env.development; then
      echo -e "${BRED}${TASK_NAME} - error: the .env.development file is missing the ${var} variable${NC}"
      exit 1
    fi
  done
}

validate_env_rsync_installed() {
  # Check if the system has rsync installed
  if ! command -v rsync &> /dev/null; then
    echo -e "${BRED}${TASK_NAME} - error: rsync is not installed. Please install rsync${NC}"
    exit 1
  fi
}

validate_env_sshpass_installed() {
  # Check if the system has sshpass installed
  if ! command -v sshpass &> /dev/null; then
    echo -e "${BYELLOW}${TASK_NAME} - sshpass is not installed. you will be prompted to enter the norns password${NC}"
    return 1
  fi
  return 0 # sshpass is installed
}
