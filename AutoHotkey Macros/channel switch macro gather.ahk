global ChannelCount := 3
global ClientPIDs := [7996, 8944]
global ClientCount := ClientPIDs.MaxIndex()

;Switches window focus to passed client
SwapClient(clientNum)
{
	temp := ClientPIDs[clientNum]
	WinActivate ahk_pid %temp%
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
		MouseClick, left,  943,  498
	else if toChannel = 3
		MouseClick, left,  943,  514
		
	Sleep, 500
	MouseClick, left,  907,  518
	Sleep, 100
}

;Program
SwapClient(1)
Sleep, 10000
Loop
{
	CurrentChannel := 1
	Loop, %ChannelCount%
	{
		;Gather on each client, in ascending order
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
		
		;Swap channel on each client, in descending order
		Loop, %ClientCount%
		{
			if %CurrentChannel% < %ChannelCount%
				SwapChannel(%CurrentChannel%+1)
			else
				SwapChannel(1)
				
			if %CurrentClient% > 1
			{
				SwapClient(%CurrentClient%-1)
				CurrentClient -= 1
			}
		}
		
		;Wait for the last one to load in
		Sleep, 10000
	}

	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		break
		
}