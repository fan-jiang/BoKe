pandoc Readme.md -o Readme.html
Set OuputFolder=Boke\
md %OuputFolder%
Set Copy=XCopy /Y /C
Set ReleaseFolder="%USERPROFILE%\Google Drive\Software\Boke"
%Copy% Readme.html %OuputFolder%
%Copy% Boke.exe %OuputFolder%
%Copy% Boke*.bat %OuputFolder%
%Copy% LICENSE.txt %OuputFolder%
"C:\Program Files\7-Zip\7z.exe" a %ReleaseFolder%\Boke.zip %OuputFolder%
