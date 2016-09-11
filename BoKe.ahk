#SingleInstance Force

FileSelectFolder, FolderSelected, C:\中醫\吳門醫述\課程, 3, 歡迎使用播課軟件！請選擇播課課件目錄：

if FolderSelected =
	MsgBox, , 播課, 您还沒有選擇播課課件目錄。
else
	MsgBox, ,播課, 您選擇播課課件的目錄是“%FolderSelected%”。請進入需要播課的微信群，將鼠標移至微信的“按住說話”的按鍵區域中，然後按“Control+B”鍵開始播課。
Return

^b::
	BlockInput, MouseMove
	Loop Files, %FolderSelected%\*.mp3, F
	{
		Progress, %a_index%, 播課中... 鼠標被鎖定。, 正在播放語音文件“%A_LoopFileName%”..., 播課
		Click down
		SoundPlay, %A_LoopFileFullPath%, WAIT
		Click up left
		if %0% != 0
		{
			Progress, Off
			MsgBox, , 播課, 按Enter鍵，繼續播課。
		}
	}
	BlockInput, MouseMoveOff
	Progress, Off
	MsgBox, ,播課, 播課圓滿結束！
	ExitApp
Return

Esc::ExitApp