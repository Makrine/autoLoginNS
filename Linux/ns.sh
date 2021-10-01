#!/bin/bash

USERAGENT=YourUserAgent
NATION1=YourNationName
PASSWORD1=YourNationPassword


if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION1&q=ping"; then
        echo "Success"
	xmessage -center "Successful log into $NATION1!"
else
        echo "Fail"
	xmessage -center "Failed to Log into $NATION1"
fi;
