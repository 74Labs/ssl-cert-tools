@ECHO OFF

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR

"%JAVA_HOME%\bin\keytool" -list -keystore %1 -storepass %2

GOTO :EOF

:ERROR

ECHO.
ECHO Invalid arguments.
ECHO.
ECHO Usage: KEYSTORE PASSWORD
ECHO.

:EOF