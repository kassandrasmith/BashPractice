#!/bin/bash
find ~ -type d -name .git | xargs -n 1 dirname > gits.txt
line=$(head -n 1 gits.txt)

echo "$line"
# cd $(line)
# echo $PATH
