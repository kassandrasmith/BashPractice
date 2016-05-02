#!/bin/bash


DATE= date +%Y-%m-%d
echo $DATE
echo $DATE

LOG_DATE=$(git log -1 HEAD --pretty=format:"%cd" --date=short)
#echo $LOG_DATE


if [[ "$LOG_DATE" -eq "$DATE" ]];
then
	echo "committed today";
else
	echo "Need to commit!!!";
 fi;

StartDate=$(date -u -d "$DATE" +"%s")
FinalDate=$(date -u -d "$LOG_DATE" +"%s")
#echo $FinalDate
#echo $StartDate 


if [[ "$StartDate" -eq "$FinalDate" ]];
then
        echo "committed today";
else
        echo "Need to commit!!!";
 fi;
