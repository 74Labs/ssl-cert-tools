@ECHO OFF

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF "%3"=="" GOTO ERROR

"%JAVA_HOME%\bin\keytool" -delete -keystore %1 -storepass %2 -alias %3 -keypass %2

GOTO :EOF

:ERROR

ECHO.
ECHO Invalid arguments.
ECHO.
ECHO Usage: KEYSTORE PASSWORD ALIAS
ECHO.

:EOF