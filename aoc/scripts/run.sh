#!/bin/env bash

help_str=$(cat << EOF
# Usage\n
run.sh <num>\n
\n
# Arguments\n
\$1=day
EOF
)

if [ "$1" == "--help" ] || [ "$1" == "-h" ];then
    echo -e $help_str
    exit 0
fi

year=$(date +"%Y")
day=$1
shift
[ -z "$day" ] &&  day=$(date +"%d")
root_dir="$(git rev-parse --show-toplevel)"
script_dir=$(dirname ${BASH_SOURCE[0]})

code_dir=${root_dir}/aoc/$year/day-$(printf "%02d" $day)

file_to_run=$(ls $code_dir | grep --max-count=1 ".py")
echo Running $file_to_run "$@"
python $code_dir/$file_to_run "$@"

