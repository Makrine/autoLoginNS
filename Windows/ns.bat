@echo off

setlocal


SET USERAGENT=YourUserAgent
SET NATION1=YourNationName
SET PASSWORD1=YourNationPassword

>nul curl -f -H "X-Password: %PASSWORD1%" -A "%USERAGENT%" "https://www.nationstates.net/cgi-bin/api.cgi?nation=%NATION1%&q=ping" && (
	echo SUCCESS
	cscript path/to/msg.vbs "Successful Log into %NATION1%"
) || (
	echo FAIL
	cscript path/to/msg.vbs "Failed to log into %NATION1%"
)

endlocal
