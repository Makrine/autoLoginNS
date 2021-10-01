@echo off

setlocal


SET USERAGENT=
SET NATION1=
SET PASSWORD1=

>nul curl -f -H "X-Password: %PASSWORD1%" -A "%USERAGENT%" "https://www.nationstates.net/cgi-bin/api.cgi?nation=%NATION1%&q=ping" && (
	echo SUCCESS
	cscript path/to/msg.vbs "Successful Log inot %NATION1%"
) || (
	echo FAIL
	cscript path/to/msg.vbs "Failed to log into %NATION1%"
)

endlocal
