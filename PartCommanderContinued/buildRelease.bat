set DEFHOMEDRIVE=d:
set DEFHOMEDIR=%DEFHOMEDRIVE%%HOMEPATH%
set HOMEDIR=
set HOMEDRIVE=%CD:~0,2%

set RELEASEDIR=d:\Users\jbb\release
set ZIP="c:\Program Files\7-zip\7z.exe"
echo Default homedir: %DEFHOMEDIR%
if "%HOMEDIR%" == "" (
set HOMEDIR=%DEFHOMEDIR%
)
echo %HOMEDIR%


copy bin\Release\PartCommanderContinued.dll ..\GameData\PartCommanderContinued\Plugins
copy ..\PartCommanderContinued.version ..\GameData\PartCommanderContinued
copy ..\..\MiniAVC.dll ..\GameData\PartCommanderContinued

xcopy /y /s /e "..\GameData\PartCommanderContinued" %HOMEDIR%\install\GameData\PartCommanderContinued
type ..\PartCommanderContinued.version
set /p VERSION= "Enter version: "

%HOMEDRIVE%
cd %HOMEDIR%\install

set FILE="%RELEASEDIR%\PartCommanderContinued-%VERSION%.zip"
IF EXIST %FILE% del /F %FILE%
%ZIP% a -tzip %FILE% Gamedata\PartCommanderContinued