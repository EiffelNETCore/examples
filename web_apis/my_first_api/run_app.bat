@echo off
set CWD=%CD%
if "%1" EQU "w" set DIR=EIFGENs\my_first_api_net7\F_code
if "%1" EQU "w" set DIR=EIFGENs\my_first_api_net7\W_code

mkdir %DIR%\Properties
copy %~dp0Properties\* %DIR%\Properties\.
copy %~dp0assets\* %DIR%\.
cd %DIR%
start "MyFirstAPI" dotnet run --launch-profile="https"
cd %CWD%


echo You can test with "curl https://localhost:7097/WeatherForecast"

goto EOF


:EOF
cd %CWD%
