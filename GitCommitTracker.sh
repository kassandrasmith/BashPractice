#!/bin/bash

DATE= date +%Y-%m-%d
echo $DATE

git log --pretty=format:"%cd" --date=short > log.txt
COMMIT_DATE= head -n 1 log.txt
echo $COMMIT_DATE

if [[ "$DATE" -eq "$COMMIT_DATE" ]];
then
	echo "committed today";
else
	echo "Need to commit!!!";
 fi;
