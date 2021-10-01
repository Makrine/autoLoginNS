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

Just copy paste everything from ```setlocal``` to ```endlocal``` except USERAGENT and change variables (E.g. NATION1 to NATION2 in the pasted script and PASSWORD1 to PASSWORD2)


## Linux

1) Download Linux folder
2) Make sure you give persmissions to the file (chmod 777)
3) Open ns.sh and change

* YourUserAgent to your user agent (e.g. your email address. [see the API documentation](https://www.nationstates.net/pages/api.html#terms))
* YourNationName to your nation name (if your nation has a space in the name, use _ (underscore) instead of the space. E.g. "My Nation" will be "my_nation" (Do Not Use quotes))
* YourNationPassword to your nation password

4) put ns.sh into startup.

* If you're using Ubuntu just search for "Startup Applications" and add it there. On other distros find some online tutorial how to add files to startup.

**Adding more nations**

To add more nations just copy paste everything except the very first line and the USERAGENT and rename variables. (E.g. NATION1 to NATION2 in the pasted script and PASSWORD1 to PASSWORD2)


## Installing cURL

on **Linux** cURL is pre-installed.

For **Windows** follow the [tutorial](https://developer.zendesk.com/documentation/developer-tools/getting-started/installing-and-using-curl/#installing-curl)
