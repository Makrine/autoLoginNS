#!/bin/bash

USERAGENT=
NATION1=
PASSWORD1=


if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION1&q=ping"; then
        echo "Success"
	xmessage -center "Successful log into $NATION1!"
else
        echo "Failed to Log into $NATION1"
	xmessage -center "Failed to Log into $NATION1"
fi;
