#!/bin/bash

##############################################################################
#
# Script to download Advent of Code input 
# put "SESSION" var in .env file
# You can session token from browser developer tools
# in Application tab
# For windows run with git bash
# > "C:/Program` Files/Git/usr/bin/bash --login -i -c 'source <path to script>'"
#
##############################################################################
#echo $(dirname "$0") #may give wrong location
function reset_tput(){
    tput sgr0;
}

function echo_msg(){
    echo [AOC] "$@"
}

function warning(){
    tput setaf 9;
    echo_msg "$@";
    reset_tput
}

function setcolors(){
    case "$1" in
        warning | Warning)
            tput setaf 9
            ;;
        *)
            tput sgr0
            ;;
    esac
}
CURR_DIR=$(dirname -- ${BASH_SOURCE[0]})
ROOT_DIR="$CURR_DIR/../.."
ENV_FILE="$ROOT_DIR/.env"
# if .env file present in the same directory as this script
# set CURR_DIR to this script directory
[ -f "$CURR_DIR/.env" ] && ENV_FILE="${CURR_DIR}/.env"

day=$1
[ -z $day ] && day=1
year=$2
[ -z $year ] && year=$(date +%Y)

echo "===================== Downloading AOC Input ==================="
echo_msg "Selected Day : $year / Day - $day"
day_padded=$(printf "%02d" "$day")
OUTPUT_FILE="${ROOT_DIR}/aoc/$year/day-${day_padded}/input.txt"
if [[ -f "$OUTPUT_FILE" ]]
then 
        warning "$OUTPUT_FILE" already exists 
        warning "Do you want to overwrite?"
        setcolors Warning
        read -n 1 -r -p "[AOC] Input Y or y for Yes , any other input for exiting : "
        echo ""
        [[ ! ${REPLY} =~ ^[Yy]$ ]] && echo_msg "exiting...";exit;
        setcolors reset
fi
                  


[ ! -d "$(dirname "$OUTPUT_FILE" )" ] && echo_msg creating $(dirname "$OUTPUT_FILE")
mkdir -p $(dirname "$OUTPUT_FILE")

SESSION=$(grep SESSION $ENV_FILE | sed 's/SESSION=//g')

CMD='curl --silent --ssl-no-revoke -b'
CMD=$CMD" session=$SESSION"
CMD=$CMD" https://adventofcode.com/$year/day/$day/input"
CMD=$CMD" -o $OUTPUT_FILE"

echo_msg "Running curl command"

$CMD
[ $? -ne 0 ] && echo Curl Command error. Unable to download input from "$_"

echo "===================== Downloaded AOC Input ==================="
