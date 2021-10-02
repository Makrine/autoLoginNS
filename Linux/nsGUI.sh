#!/usr/bin/bash

# output files for USERAGENT and NATION/PASSWORD
# WARNING password is NOT encrypted! User agent, nation names and passwords are saved in a plain text. I will work on that in the near future
agentFile="agent"
namepassFile="namepass"


# function for making a cURL request to NationStates API
request () {
    if curl --fail --silent -H "X-Password: $3" -A "$1" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$2&q=ping" > /dev/null; then
        echo "Success"
        zenity --info --text="Successful log into $2"
    else
        echo "Fail"
	    zenity --info --text="Failed to log into $2"
    fi;
}

# enter your nation's name and password using Zenity GUI
nationCredentials () {
    NamePass=$(zenity --forms --title="Nation States" --text="Add a new nation" \
                --add-entry="Nation Name"  \
                --add-password="Password")

    NATION=`echo $NamePass | cut -d"|" -f 1`
    PASSWORD=`echo $NamePass | cut -d"|" -f 2`
    # if either Nation or Password is empty
    if [ "$NATION" == "" ] || [ "$PASSWORD" == "" ]; then
        zenity --info --text="Please input both name and password"
        exit 1
    elif [ $(nationInFile $NATION) == "YES" ]; then
        zenity --warning --text="Nation is already added"
        moreNations
    else
        res=$(request $AGENT $NATION $PASSWORD)
    fi
    
    if [ "$res" == "Success" ]; then 
        echo $NamePass >> $namepassFile
    elif [ "$res" == "Fail" ]; then
        echo "Fail"
    fi

    moreNations
}


moreNations () {
    zenity --question --text="Add more nation(s)?"
    if [ $? -eq 1 ]; then
        exit 1
    else 
        nationCredentials
    fi
}

nationInFile () {
    if grep -q $1 $namepassFile
    then
        echo "YES"
    else
        echo "NO"
    fi
}

# if USERAGENT already exists then check if NATION/PASSWORD file exists
# If NATION/PASSWORD exists then read it line by line and log into all the nations, if not enter your nations's credentials
if [ -f "$agentFile" ]; then
    echo "$agentFile exists."

    # read agent from the file
    AGENT=$(sed '1q;d' $agentFile)

    # check if the NATION/PASSWORD file exists
    if [ -f "$namepassFile" ]; then
        echo "$namepassFile exists"
        # read line by line and log into all of them
        while IFS= read -r NamePass
        do
            echo "$NamePass"
            NATION=`echo $NamePass | cut -d"|" -f 1`
            PASSWORD=`echo $NamePass | cut -d"|" -f 2`

            request $AGENT $NATION $PASSWORD
        done < "$namepassFile"

        moreNations

    # if not, enter the credentials and log in
    else
        nationCredentials
    fi
# if the USERAGENT doesn't exist, make one and enter nation's credentials.
else 
    echo "$agentFile does not exist."

    AGENT=$(zenity --entry --title="Nation States" --text="Set an User Agent")
    if [ "$AGENT" == "" ]; then
        zenity --info --text="Please input User Agent"
        exit 1
    fi

    echo $AGENT > $agentFile
    if [ -f "$namepassFile" ]; then
        echo "$namepassFile exists"
        # read line by line and log into all of them
        while IFS= read -r NamePass
        do
            echo "$NamePass"
            NATION=`echo $NamePass | cut -d"|" -f 1`
            PASSWORD=`echo $NamePass | cut -d"|" -f 2`

            request $AGENT $NATION $PASSWORD
        done < "$namepassFile"

        moreNations
    else
        nationCredentials
    fi

fi
