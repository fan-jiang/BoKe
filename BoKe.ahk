#SingleInstance Force

FileSelectFolder, FolderSelected, C:\中醫\吳門醫述\課程, 3, 歡迎使用播課軟件！請選擇播課課件目錄：

if FolderSelected =
	MsgBox, , 播課, 您还沒有選擇播課課件目錄。
else
{
	Global NumOfFiles := 0
	Progress, ,正在處理語音文件..., 播課
	Global GeneratedFolder := FolderSelected . "`\Trimmed"
	IfExist, %GeneratedFolder%
		FileRemoveDir, %GeneratedFolder%, 1
	FileCreateDir, %GeneratedFolder%
	Loop Files, %FolderSelected%\*.mp3, F
	{
		NumOfFiles++
		TrimCommand = "%A_ScriptDir%\ffmpeg\ffmpeg.exe" -i "%A_LoopFileFullPath%" -ss 00:00:03 -to 00:01:02 "%GeneratedFolder%\%A_LoopFileName%"
		Run %TrimCommand%, ,Hide
	}
	Progress, Off
	MsgBox, ,播課, 您選擇播課課件的目錄是“%FolderSelected%”。請進入需要播課的微信群，將鼠標移至微信的“按住說話”的按鍵區域中，然後按“Control+B”鍵開始播課。
}
Return

^b::
	Global NumOfFiles, GeneratedFolder
	BlockInput, MouseMove
	Loop Files, %GeneratedFolder%\*.mp3, F
	{
		Progress, % (a_index / NumOfFiles) * 100, 播課中...`n鼠標移動功能已被鎖定。, 正在播放語音文件“%A_LoopFileName%”..., 播課
		Click down
		SoundPlay, %A_LoopFileFullPath%, WAIT
		Click up left
		if %0% != 0
		{
			BlockInput, MouseMoveOff
			Progress, Off
			MsgBox, , 播課, 按Enter鍵，繼續播課。
			BlockInput, MouseMove
		}
	}
	BlockInput, MouseMoveOff
	Progress, Off
	MsgBox, ,播課, 播課圓滿結束！
	ExitApp
Return

Esc::ExitApp