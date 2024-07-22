@echo off
set CWD=%CD%
if "%1" EQU "f" set DIR=EIFGENs\base_tester\F_code
if "%1" EQU "w" set DIR=EIFGENs\base_tester\W_code

mkdir %DIR%\Properties
mkdir %DIR%\Views
mkdir %DIR%\Views\Home
mkdir %DIR%\Views\Shared
copy %~dp0Properties\* %DIR%\Properties\.
copy %~dp0assets\* %DIR%\.
copy %~dp0Views\* %DIR%\Views\.
copy %~dp0Views\Home %DIR%\Views\Home\.
copy %~dp0Views\Shared %DIR%\Views\Shared\.
cd %DIR%
start "BaseTester" dotnet run --launch-profile="https"
cd %CWD%


echo You can test with "curl https://localhost:7097"

goto EOF


:EOF
cd %CWD%
