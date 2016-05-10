#!/bin/bash
committedToday=false;

  # find ~ 2>/dev/null -type d -name .git | xargs -n 1  > gits.txt
  find ~ -name .git -type d -prune  > /home/kassandra/Documents/BashPractice/gits.txt

numOfLines=$(grep -c ^ gits.txt)
# echo "$numOfLines"
lineNum=1
while [[ lineNum -lt numOfLines ]]; do

cd
  DATE= date +%Y-%m-%d > date.txt
  # echo $DATE

  LOG_DATE=$(git log -1 HEAD --pretty=format:"%cd" --date=short)
  #echo $LOG_DATE


  # if [[ "$LOG_DATE" -eq "$DATE" ]];
  # then
  #         # echo "committed today";
  #         committedToday=true;
  # # else
  # #         echo "Need to commit!!!";
  #  fi;

  StartDate=$(date -u -d "$DATE" +"%s")
  FinalDate=$(date -u -d "$LOG_DATE" +"%s")
  #echo $FinalDate
  #echo $StartDate


  if [[ "$StartDate" -eq "$FinalDate" ]];
  then
          # echo "committed today";
          committedToday=true;

  # else
  #         echo "Need to commit!!!";
   fi;


  line=$(head -"${lineNum}" gits.txt | tail -1)
  cd $line;
  # echo "$line";
  let "lineNum += 1";
  echo "$lineNum";
  # find ~ 2>/dev/null -type d -name .git | xargs -n 1  > gits.txt

  find ~ -name .git -type d -prune &> /dev/null
  # > /home/kassandra/Documents/BashPractice/gits.txt

done

if [ "$committedToday" = false ] ; then
    echo "You still need to commit!";
  else
          echo "You've committed today.";
fi
