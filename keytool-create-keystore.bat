@ECHO OFF

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR

ECHO.
ECHO Creating temporary entry...

"%JAVA_HOME%\bin\keytool" -genkey ^
	-keystore %1 -storepass %2 ^
	-alias temp_alias -keypass %2 ^
	-dname "CN=temp_alias, OU=temp_ou, O=temp_o, L=temp_l, S=temp_s, C=PL"

ECHO.
ECHO Deleting temporary entry...

call "%~dp0keytool-delete-cert.bat" %1 %2 temp_alias

ECHO.
ECHO Checking keystore...
ECHO.

call "%~dp0keytool-list-cert.bat" %1 %2

GOTO :EOF

:ERROR

ECHO.
ECHO Invalid arguments.
ECHO.
ECHO Usage: KEYSTORE PASSWORD
ECHO.

:EOF