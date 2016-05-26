#!/bin/bash
#Get user to search for gits under
USER=$(sed -n '3p' < ~/.Message.txt)
#Don't break on whitespaces
IFS=''
cat RepositoryDirectory.txt |
(while read data
do
cd #not necessary, but a safeguard to start at HOME
  cd $data;
  cd .. #compensate for .git at end of line
#Get the most recent date from the log, checking only for specified user
  LOG_DATE=$(git log --author=$USER -1 HEAD --pretty=format:"%cd" --date=short)

#Compensate for repos where the user hasn't contributed
  if [ -z "$LOG_DATE" ]
  then
     :
    #do nothing
  else
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
              FinalDate=$(date -d "$LOG_DATE" +"%s")
	    elif [[ "$OSTYPE" == "darwin"* ]]; then
            # Mac OSX
              DATE=$(date +%Y-%m-%d) &> /dev/null #Silence date output
              StartDate=$(date -jf "%Y-%m-%d" "$DATE" +"%s")
              FinalDate=$(date -jf "%Y-%m-%d" "$LOG_D ATE" +"%s")


    elif [[ "$OSTYPE" == "cygwin" ]]; then
            # POSIX compatibility layer and Linux environment emulation for Windows
            echo cygwin not yet tested, results may be incorrect;
            DATE=$(date +%Y-%m-%d) &> /dev/null #Silence date output
            StartDate=$(date -d "$DATE" +"%s")
            FinalDate=$(date -d "$LOG_DATE" +"%d")

    elif [[ "$OSTYPE" == "msys" ]]; then
            # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
            echo mysys not yet tested, results may be incorrect;
            DATE=$(date +%Y-%m-%d) &> /dev/null #Silence date output
            StartDate=$(date -d "$DATE" +"%d")
            FinalDate=$(date -d "$LOG_DATE" +"%d")

    elif [[ "$OSTYPE" == "win32" ]]; then
            # I'm not sure this can happen.
            echo Win32 not supported.
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
            # ...
            DATE=$(date +%Y-%m-%d) &> /dev/null #Silence date output
            StartDate=$(date -jf "%Y-%m-%d" "$DATE" +"%d")
            FinalDate=$(date -jf "%Y-%m-%d" "$LOG_DATE" +"%d")
    else
            # Unknown.
            echo
    fi
fi 
done
echo $FinalDate
