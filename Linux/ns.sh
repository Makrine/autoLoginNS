#!/bin/bash

PASSWORD=paroli28
USERAGENT=tmakrine@gmail.com
NATION1=mackiland
NATION2=mouightaingand
NATION3=imaginelandia
NATION4=groundlandy
NATION5=macktatoria
NATION6=fans_of_macktatoria
NATION7=freespirito



if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION1&q=ping"; then
        echo "Success"
	xmessage -center "Successful log into $NATION1!"
else
        echo "Failed to Log into $NATION1"
	xmessage -center "Failed to Log into $NATION1"
fi;


if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION2&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION2"
fi;

if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION3&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION3"
fi;

if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION4&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION4"
fi;

if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION5&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION5"
fi;

if curl --fail -H "X-Password: $PASSWORD" -A "$USERAGENT" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION6&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION6"
fi;

if curl --fail -H "X-Password: $PASSWORD" -A "tmakrine@gmail.com" "https://www.nationstates.net/cgi-bin/api.cgi?nation=$NATION7&q=ping"; then
        echo "Success"
else
        echo "Failed to Log into $NATION7"
fi;
