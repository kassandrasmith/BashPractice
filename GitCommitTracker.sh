#!/bin/bash
committedToday=false;
#find all git repositories and put them into this text file
# find ~ -name .git -type d -prune 2>/dev/null  > RepositoryDirectory.txt
## numOfLines=$(grep -c ^ gits2.txt)
## echo "$numOfLines"

#add globbers for files with a newline
awk '{gsub(/ /,"\\ ")}8' RepositoryDirectory.txt > gits.txt

#Don't break on whitespaces
IFS=''
cat gits.txt |
while read data
do

#not necessary, but a safeguard to get to root
cd
  line=$data;
  cd $data;
  cd .. #compensate for .git at end of line
  DATE= date +%Y-%m-%d &> /dev/null
  LOG_DATE=$(git log -1 HEAD --pretty=format:"%cd" --date=short)
  StartDate=$(date -u -d "$DATE" +"%s")
  FinalDate=$(date -u -d "$LOG_DATE" +"%s")
  # echo $FinalDate
  # echo $StartDate
  if [[ "$StartDate" -eq "$FinalDate" ]];
  then
          committedToday=true;
          # echo "commit found"
          echo $committedToday > committed.txt

   fi;
# echo $committedToday

# echo "$data"
done
## <<< "$(echo -e "$committedToday")"

# Temporary workaround for subshell issue

## echo $committedToday
committedToday=$(head -1 committed.txt)

# echo $committedToday

if [ "$committedToday" = false ] ; then
    echo "You still need to commit!";
  else
    echo "You've committed today.";
fi

rm committed.txt
