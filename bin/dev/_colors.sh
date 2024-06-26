#!/bin/bash

# This script can be sourced by other scripts to support simple colorized output in the terminal.
#
# Example usage:
# ```sh`
# source bin/dev/_colors.sh # This will load the color variables into the current shell session.
# echo -e "${BLUE}running…${NC}" # This will output the text "running…" in blue, and then reset the color to the default.
# ````

# Regular Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold
BBLACK='\033[1;30m'
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
BPURPLE='\033[1;35m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'

# Underline
UBLACK='\033[4;30m'
URED='\033[4;31m'
UGREEN='\033[4;32m'
UYELLOW='\033[4;33m'
UBLUE='\033[4;34m'
UPURPLE='\033[4;35m'
UCYAN='\033[4;36m'
UWHITE='\033[4;37m'

# Background
ON_BLACK='\033[40m'
ON_RED='\033[41m'
ON_GREEN='\033[42m'
ON_YELLOW='\033[43m'
ON_BLUE='\033[44m'
ON_PURPLE='\033[45m'
ON_CYAN='\033[46m'
ON_WHITE='\033[47m'

# No Color
NC='\033[0m' # No Color