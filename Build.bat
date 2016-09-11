:: Build
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in BoKe.ahk /icon BoKe.ico
pandoc Readme.md -o Readme.html

:: Release

Set OuputFolder=Boke\
md %OuputFolder%
Set Copy=XCopy /Y /C
Set ReleaseFolder="%USERPROFILE%\Google Drive\Software\Boke"
%Copy% Readme.html %OuputFolder%
%Copy% Boke.exe %OuputFolder%
%Copy% Boke*.bat %OuputFolder%
%Copy% LICENSE.txt %OuputFolder%
%Copy% Readme.md %ReleaseFolder%
"C:\Program Files\7-Zip\7z.exe" a %ReleaseFolder%\Boke.zip %OuputFolder%
