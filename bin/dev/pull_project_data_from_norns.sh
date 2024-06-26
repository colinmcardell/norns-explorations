#!/bin/bash

source bin/dev/_colors.sh
source bin/dev/_environment.sh

TASK_NAME="pull project dust/data from norns"

# This script will sync the contents of the remote norns project data folder to
# the local `bin/dev/data` folder.
echo -e "${YELLOW}👏 running task: ${TASK_NAME} - bin/dev/pull_project_data_from_norns.sh …${NC}"

# The `.env.development` file contains the environment variables that the script
# will use.
validate_env_variables # From _environment.sh: validate the environment variables in the `.env.development` file
validate_env_rsync_installed # From _environment.sh: check if the system has rsync installed

# Load environment variables from .env.development file
source .env.development

echo -e "${BLUE}${TASK_NAME} - syncing 📡 dust/data/${SCRIPT_NAME} from ${NORNS_USER}@${NORNS_HOST} ⤵ 💻 bin/dev/data/${SCRIPT_NAME} …${NC}"

# Run rsync command with the loaded variables
if validate_env_sshpass_installed; then
  # Run rsync command with the loaded variables using sshpass for
  # non-interactive authentication
  sshpass -p "${NORNS_PASSWORD}" rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no" ${EXCLUDES[@]} ${NORNS_USER}@${NORNS_HOST}:${DESTINATION_PATH}/data/${SCRIPT_NAME} ./bin/dev/data
else
  rsync -avz --delete ${EXCLUDES[@]} ${NORNS_USER}@${NORNS_HOST}:${DESTINATION_PATH}/data/${SCRIPT_NAME} ./bin/dev/data
fi

echo -e "\n${GREEN}${TASK_NAME} - task complete ⭐️${NC}"
 
