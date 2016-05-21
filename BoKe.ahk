^b::
	SoundSetWaveVolume, 100
	Loop Files, C:\Boke\*.mp3, F
	{
		Click down
		SoundPlay, %A_LoopFileFullPath%, WAIT
		Click up left
	}
	ExitApp
Return

; Semi automation: to simulate the mouse press
NumPad0::
   Click down
Return

NumPad1::
   Click up left
Return

Esc::ExitApp