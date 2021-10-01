# autoLoginNS
automatically log into your NS nations to avoid CTE.

# How to use

## Windows

1) Download Windows folder from the repository.
2) Open ns.bat script and change 
  
* YourUserAgent to your user agent (e.g. your email address. [see the API documentation](https://www.nationstates.net/pages/api.html#terms))
* YourNationName to your nation name (if your nation has a space in the name, use _ (underscore) instead of the space. E.g. "My Nation" will be "my_nation" (Do Not Use quotes))
* YourNationPassword to your nation password
* path/to/msg.vbs to the path where the msg.vbs is located. This file is for alerting whether the log in was successful or not. E.g. if the file is on Desktop in Windows folder then you change it into C:\Users\YourAccountName\Desktop\Windows\msg.vbs

and SAVE it

3) if you want the script to be run every time you turn on your computer then 

* Press Windows + R key to open Run
* type shell:startup and OK
* and place the ns.bat file there

So it will be run on startup


**Adding more nations**

Just copy paste everything from ```setlocal``` to ```endlocal```

*EXAMPLE for 3 Nations*
```

@echo off

setlocal


SET USERAGENT=YourUserAgent
SET NATION1=YourNationName1
SET PASSWORD1=YourNationPassword1

SET NATION2=YourNationName2
SET PASSWORD2=YourNationPassword2

SET NATION3=YourNationName3
SET PASSWORD3=YourNationPassword3

>nul curl -f -H "X-Password: %PASSWORD1%" -A "%USERAGENT%" "https://www.nationstates.net/cgi-bin/api.cgi?nation=%NATION1%&q=ping" && (
	echo SUCCESS
	cscript path/to/msg.vbs "Successful Log into %NATION1%"
) || (
	echo FAIL
	cscript path/to/msg.vbs "Failed to log into %NATION1%"
)

>nul curl -f -H "X-Password: %PASSWORD2%" -A "%USERAGENT%" "https://www.nationstates.net/cgi-bin/api.cgi?nation=%NATION2%&q=ping" && (
	echo SUCCESS
	cscript path/to/msg.vbs "Successful Log into %NATION2%"
) || (
	echo FAIL
	cscript path/to/msg.vbs "Failed to log into %NATION2%"
)

>nul curl -f -H "X-Password: %PASSWORD3%" -A "%USERAGENT%" "https://www.nationstates.net/cgi-bin/api.cgi?nation=%NATION3%&q=ping" && (
	echo SUCCESS
	cscript path/to/msg.vbs "Successful Log into %NATION3%"
) || (
	echo FAIL
	cscript path/to/msg.vbs "Failed to log into %NATION3%"
)

endlocal
```

*"NATION1" variable is called 3 times in the code, "PASSWORD1" is called once and "USEAGENT" is called once. You just need to edit NATION1 and PASSWORD1 variables in the copy-pasted code*


## Linux

1) Download Linux folder
2) 
