#SingleInstance Force

FileSelectFolder, FolderSelected, C:\中醫\吳門醫述\課程, 3, 歡迎使用播課軟件！請選擇播課課件目錄：

if FolderSelected =
	MsgBox, , 播課, 您还沒有選擇播課課件目錄。
else
{
	Global NumOfFiles := 1
	MsgBox, 4,, 您需要剪輯語音文件嗎？
	IfMsgBox Yes
	{
		StartTime := A_TickCount
		trimmed := true
		Progress, ,正在處理語音文件..., 播課
		GeneratedFolder := FolderSelected . "`\Trimmed"
		IfExist, %GeneratedFolder%
			FileRemoveDir, %GeneratedFolder%, 1
		FileCreateDir, %GeneratedFolder%
		Loop Files, %FolderSelected%\*.mp3, F
		{
			NumOfFiles++
			TrimCommand = "%A_ScriptDir%\ffmpeg\ffmpeg.exe" -i "%A_LoopFileFullPath%" -ss 00:00:03 -to 00:01:02 "%GeneratedFolder%\%A_LoopFileName%"
			RunWait %TrimCommand%, ,Hide
		}
		Progress, Off
		ElapsedTime := Floor((A_TickCount - StartTime) / 1000)
		MsgBox, ,播課, 總計語音處理時間是%ElapsedTime%秒。
	}
	Else
	{
		Loop Files, %FolderSelected%\*.mp3, F
			NumOfFiles++
	}
	Global WorkingFolder := FolderSelected
	If trimmed
		WorkingFolder := GeneratedFolder
	MsgBox, ,播課, 您選擇播課課件的目錄是“%WorkingFolder%”。請進入需要播課的微信群，將鼠標移至微信的“按住說話”的按鍵區域中，然後按“Control+B”鍵開始播課。
}
Return

^b::
	StartTime := A_TickCount
	Global NumOfFiles, WorkingFolder
	BlockInput, MouseMove
	Loop Files, %WorkingFolder%\*.mp3, F
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
	ElapsedTime := Floor((A_TickCount - StartTime) / 60000)
	MsgBox, ,播課, 總計播課時間是%ElapsedTime%分鐘。 播課圓滿結束！
	ExitApp
Return

Esc::ExitApp