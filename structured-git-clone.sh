#!/usr/bin/env bash
#system requirements: sudo apt install xsel

# get text from clipboard
clipboardText=$(xsel --clipboard)

# format it so that it takes either git@gitlab.com:appliedsystems/devops/templates/ci.git or https://gitlab.com/appliedsystems/devops/templates/ci.git and turns it into ~/gitlab.com/appliedsystems/devops/templates
newDirectory=$(echo "$clipboardText" | awk '{gsub("https://", "", $0); print $0}' | awk '{gsub("git@", "", $0); print $0}' | awk '{gsub(/\/[a-z-]+.git/, "", $0); print $0}' | awk '{gsub(":", "/", $0); print $0}')
#testInput1="git@gitlab.com:appliedsystems/products/rating/ca/services/commercial.git"
#testInput2="https://gitlab.com/appliedsystems/products/rating/ca/services/commercial.git"
#testOutput1=$(echo "~/$testInput1" | awk '{gsub("https://", "", $0); print $0}' | awk '{gsub("git@", "", $0); print $0}' | awk '{gsub(/\/[a-z-]+.git/, "", $0); print $0}' | awk '{gsub(":", "/", $0); print $0}')
#testOutput2=$(echo "~/$testInput2" | awk '{gsub("https://", "", $0); print $0}' | awk '{gsub("git@", "", $0); print $0}' | awk '{gsub(/\/[a-z-]+.git/, "", $0); print $0}' | awk '{gsub(":", "/", $0); print $0}')
#echo "testOutput1: $testOutput1"
#echo "testOutput2: $testOutput2"

# make the directory from the string above
cd ~
mkdir -p $newDirectory

# clone the repo to that directory
cd $newDirectory
git clone $clipboardText
