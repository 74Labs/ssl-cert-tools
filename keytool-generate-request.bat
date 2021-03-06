@ECHO OFF

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF "%3"=="" GOTO ERROR
IF "%~4"=="" GOTO ERROR

ECHO.
ECHO Creating entry...

"%JAVA_HOME%\bin\keytool" -genkeypair -keysize 2048 -keyalg RSA ^
	-keystore %1 -storepass %2 ^
	-alias %3 -keypass %2 ^
	-dname "CN=%3, C=PL" -ext san="%~4"

ECHO.
ECHO Generating request...

"%JAVA_HOME%\bin\keytool" -certreq -keystore %1 -storepass %2 -alias %3 -keypass %2 -ext san="%~4" -file %3.csr

GOTO :EOF

:ERROR

ECHO.
ECHO Invalid arguments.
ECHO.
ECHO Usage: KEYSTORE PASSWORD ALIAS "SAN"
ECHO.

:EOF