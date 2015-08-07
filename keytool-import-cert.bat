@ECHO OFF

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF "%3"=="" GOTO ERROR

ECHO.
ECHO Importing certificate...

"%JAVA_HOME%\bin\keytool" -import ^
	-keystore %1 -storepass %2 ^
	-alias %3 -keypass %2 ^
	-file %3.cer
	
:ERROR

ECHO.
ECHO Invalid arguments.
ECHO.
ECHO Usage: KEYSTORE PASSWORD ALIAS
ECHO.

:EOF	