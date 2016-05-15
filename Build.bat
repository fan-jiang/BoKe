:: Build
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in BoKe.ahk
pandoc Readme.md -o Readme.html

:: Release

Set Destination="%USERPROFILE%\Google Drive\Software\Boke"
Set Copy=XCopy /Y /S /C
%Copy% Readme.html %Destination%
%Copy% Boke.exe %Destination%
%Copy% LICENSE.txt %Destination%

