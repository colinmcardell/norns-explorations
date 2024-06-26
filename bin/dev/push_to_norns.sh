#!/bin/bash

source bin/dev/_colors.sh
source bin/dev/_environment.sh

TASK_NAME="push script to norns"

# This script will sync the contents of the local project to the remote
# `DESTINATION_PATH`/`PROJECT_NAME` on the norns.
echo -e "${YELLOW}👏 running task: ${TASK_NAME} - bin/dev/push_to_norns.sh …${NC}"

# The local `.env.development` file contains the environment variables that the
# script will use.
validate_env_variables # From _environment.sh: validate the environment variables in the `.env.development` file
validate_env_rsync_installed # From _environment.sh: check if the system has rsync installed

# Load environment variables from .env.development file
source .env.development

echo -e "${BLUE}${TASK_NAME} - syncing 💻 ${SCRIPT_NAME} project ⤴ 📡 ${NORNS_USER}@${NORNS_HOST} …${NC}"

# Run rsync command with the loaded variables
if validate_env_sshpass_installed; then
  # Run rsync command with the loaded variables using sshpass for
  # non-interactive authentication
  sshpass -p "${NORNS_PASSWORD}" rsync -avzm --delete -e "ssh -o StrictHostKeyChecking=no" ${EXCLUDES[@]} ./ ${NORNS_USER}@${NORNS_HOST}:${DESTINATION_PATH}/code/${SCRIPT_NAME}
else
  rsync -avzm --delete ${EXCLUDES[@]} ./ ${NORNS_USER}@${NORNS_HOST}:${DESTINATION_PATH}/${SCRIPT_NAME}
fi

echo -e "\n${GREEN}${TASK_NAME} - task complete ⭐️${NC}"
 