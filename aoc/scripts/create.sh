#!/bin/env bash

# Arguments
# $1 = day
help_str=$(cat << EOF
# Usage\n
create.sh <num>\n
\n
# Arguments\n
\$1 = day
EOF
)
if [ "$1" == "--help" ] || [ "$1" == "-h" ];then
    echo -e $help_str
    exit 0
fi

day=$1
file_ext=".py"
shift
[ -z "$day" ] &&  day=$(date +"%d")
year=$(date +"%Y")

root_dir="$(git rev-parse --show-toplevel)"
script_dir=$(dirname ${BASH_SOURCE[0]})

code_dir=${root_dir}/aoc/$year/day-$(printf "%02d" $day)

printf -- "-%.0s" {1..50}
printf "\n\e[33;1mGetting Question of the day-\e[35m$(printf "%02d" $day)\e[0m\n"
que_name=$(curl --silent "https://adventofcode.com/2022/day/${day}"  | grep -oP '(?<=---\s)(Day\s[0-9]:)(\s*\w*)*\s')

que_name=$(echo $que_name | cut -d : -f 2 | sed -Ee "s/(^\s*)|(\s*$)//g" ) 
file_to_create=$(echo $que_name | sed -Ee "s/(^\s*)|(\s*$)//g"  -Ee "s/\s/_/g")
#echo $file_to_create${file_ext}

template_file=$root_dir/aoc/templates/template${file_ext}
dest_file=$code_dir/${file_to_create}${file_ext}
printf -- "-%.0s" {1..50}
printf "\n\e[33;1mCopying template file\e[0m\n"
sed -E "s/<que name>/${que_name}/g" $template_file > ${dest_file}

tree $code_dir/..
message="$(echo  "${dest_file}" | sed -Ee "s|${root_dir}||g" -Ee "s|^\/*||g" | sed -E "s|(${file_to_create})|\\\\e[34;1m\1\\\\e[0m|g" ) written"
echo -e ${message}
#./${script_dir}/download_aoc_input.sh $day      

