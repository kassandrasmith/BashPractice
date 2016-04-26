#!/bin/bash

DATE= date +%Y-%m-%d
echo $DATE
git log --pretty=format:"%cd" --date=short > log.txt

COMMIT_DATE= tail -2 log.txt | head -1
echo $COMMIT_DATE

 if [ $DATE=$COMMIT_DATE ];
	then echo "committed today"
 fi
