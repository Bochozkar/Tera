ChannelCount := 3
ClientCount := 2
ClientPID1 := 7996
ClientPID2 := 8944
ClientPID3 := 0
ClientPID4 := 0
ClientPID5 := 0

;startup delay
Sleep, 10000

;Switches window focus to passed client
SwapClient(clientNum)
{
	WinActivate ahk_pid ClientPID%clientNum%
	Sleep, 900
}

;Swaps to channel using system menu based on the channel passed (1 to 3)
SwapChannel(toChannel)
{
	Send, {ALT DOWN}{ALT UP}
	;Wait for UI Lag
	Sleep, 1000
	MouseClick, left,  1768,  1038
	Sleep, 200
	MouseClick, left,  1753,  977
	Sleep, 200
	MouseClick, left,  951,  459
	Sleep, 200
	
	if toChannel = 1
		MouseClick, left,  943,  477
	else if toChannel = 2
		MouseClick, left,  950,  498
	else if toChannel = 3
		MouseClick, left,  943,  514
		
	Sleep, 500
	MouseClick, left,  907,  518
	Sleep, 100
}

;Program
Loop
{
	CurrentChannel := 1
	Loop, %ChannelCount%
	{
		;Gather on each client
		CurrentClient := 1
		Loop, %ClientCount%
		{
			Send, F
			Sleep, 300
			if %CurrentClient% < %ClientCount%
			{
				SwapClient(%CurrentClient%+1)
				CurrentClient += 1
			}
		}
		
		;Swap channel on each client
		Loop, %ClientCount%
		{
			if %CurrentChannel% < %ChannelCount%
				SwapChannel(%CurrentChannel%+1)
			else
				SwapChannel(1)
		}
		SwapChannel(1)
		;Wait for the last one to load in
		Sleep, 10000
	}

	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		break
		
}