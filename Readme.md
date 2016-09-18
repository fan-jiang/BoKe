# 前言

`BoKe`是微信播課工具。它能自動化播課過程，使播課人員從繁重的播課任務中解脫出來。

使用此軟件的前提是播課人員了解播課攻略，能夠手動播課，熟悉播課流程。 `BoKe`軟件只是讓播課人員完全免除了鼠標操作。

播課人員在自動播課過程中，需要密切關注播課狀態。 一旦自動播課出現異常，馬上需要退出程序（按`Esc`鍵），改用手動播課。

# 軟件安裝

- 在台式機上，點擊鏈接<https://drive.google.com/file/d/0By077ki7vnOma1RZeU9WUzVMZEU/view?usp=sharing>。
- 點擊下載圖標，下載`Boke.zip`，見下圖：

	![](Download.png)

- 解壓文件`Boke.zip`至任意路徑（比如`C:\WuMen`）。

# 自動播課

- 打開安卓虛擬器（比如，夜神`Nox.exe`），運行微信程序。

- 播課前，雙擊`BoKe.exe`文件（比如，`C:\WuMen\BoKe\Boke.exe`）。

	![](RunBoke.png)

- 程序運行後，選擇播課目錄。

	![](ChooseDirectory.png)
	目錄選好後，軟件會提示是否需要處理語音文件。如是，播課軟件會自動消除每條語音前面的三秒空白。

- `BoKe`會顯示說明。點擊"OK"鍵。

	![](Instructions.png)

- 進入需要播課的微信群：

	![](EnterGroup.png)
	
- 將鼠標移至微信的“按住說話”的按鍵區域中。

	![](Talk.png)
	
- 按鍵"Control"的同時，按"B"鍵。
- 軟件將自動開始逐條播放選擇目錄中的`mp3`語音文件。同時`BoKe`會鎖定鼠標。
- 最後一條語音播放結束後，播課程序會自動退出運行。

# 說明

- 播課過程中，如需中斷播課，按`Esc`鍵停止播課程序的運行。
- 播課程序只能在Windows環境下運行。
- 此工具是從[AutoHotKey][1]的腳本文件生成的，它的源代碼在[這裡][2]。


祝播課愉快！

[1]: https://www.autohotkey.com/
[2]: https://github.com/fan-jiang/BoKe

