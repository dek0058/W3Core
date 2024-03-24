setlocal
SET WARCRAFT_PATH="C:\Program Files (x86)\Warcraft III\_retail_\x86_64\Warcraft III.exe"
SET MAP_PATH=%~dp0UnitTestMap.w3x
%WARCRAFT_PATH% -launcher -loadfile %MAP_PATH% -hd 0 -teen 0 -nowfpause -windowmode windowed
endlocal
