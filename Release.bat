Call Build
pandoc Readme.md -o Readme.html
pandoc Readme.md -o Readme.docx
Set OuputFolder=Boke\
md %OuputFolder%
Set Copy=XCopy /Y /C
Set ReleaseFolder="%USERPROFILE%\Google Drive\Software\Boke"
%Copy% Boke.exe %OuputFolder%
%Copy% Boke*.bat %OuputFolder%
%Copy% LICENSE.txt %OuputFolder%
%Copy% Readme.docx %OuputFolder%
%Copy% Readme.md %ReleaseFolder%
%Copy% Readme.docx %ReleaseFolder%
Del %ReleaseFolder%\Boke.zip 
"C:\Program Files\7-Zip\7z.exe" a %ReleaseFolder%\Boke.zip %OuputFolder%
