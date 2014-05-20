;TODO
;Add support for plentiful nodes

global ChannelCount := 3 ;max 3
global ClientPIDs := [7108, 1472, 3552]
global ClientCount := ClientPIDs.MaxIndex()
global StartingChannel := 2
global DelayMultiplier := 1.0

;Switches window focus to passed client
SwapClient(clientNum)
{
	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
		
	temp := ClientPIDs[clientNum]
	WinActivate, ahk_pid %temp%
	WinWaitActive, ahk_pid %temp%
}

;Swaps to channel using system menu based on the channel passed (1 to 3)
SwapChannel(toChannel)
{
	

	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
		
	Send, {ALT DOWN}{ALT UP}
	;Wait for UI Lag
	Sleep, 1500 * DelayMultiplier
	MouseClick, left,  1768,  1038
	Sleep, 200 * DelayMultiplier
	MouseClick, left,  1753,  977
	Sleep, 200 * DelayMultiplier
	MouseClick, left,  951,  459
	Sleep, 400 * DelayMultiplier
	
	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
		
	if toChannel = 1
	{
		MouseClick, left,  943,  477
	}
	else if toChannel = 2
	{
		MouseClick, left,  943,  498
	}
	else if toChannel = 3
	{
		MouseClick, left,  943,  514
	}
	
	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
		
	Sleep, 500
	MouseClick, left,  907,  518
	Sleep, 300
	
	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
}

;Program
Sleep, 2000
Loop
{
		
	CurrentChannel := StartingChannel
	Loop, %ChannelCount%
	{
		;Gather on each client
		for index,PID in ClientPIDs
		{
			;Stop if holding shift
			GetKeyState, state, Shift
			if state = D
				Exit
				
			SwapClient(index)
			Send, F
			Sleep, 200
		}
		
		;Swap channel on each client
		for index,PID in ClientPIDs
		{
			SwapClient(index)
			if (CurrentChannel < ChannelCount)
			{
				SwapChannel(CurrentChannel + 1)
			}
			else SwapChannel(1)
		}
		
		;We are in the next channel now
		if (CurrentChannel < ChannelCount)
			CurrentChannel += 1
		else CurrentChannel := 1
		
		;Stop if holding shift
		GetKeyState, state, Shift
		if state = D
			Exit
		
		;Wait for the clients to load in
		Sleep, 10000
	}

	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		Exit
		
}