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

Esc::ExitApp