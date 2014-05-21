;IMPORTANT NOTE:
;USING THIS PROGRAM IS AGAINST TOS AS CONFIRMED BY THE SUPPORT TEAM

;TODO
;Add support for plentiful nodes
;Add UI popup to enter in starting channel
;Add read/write to external file to save mouse co-ords

global ChannelCount := 3 ;max 3
global ClientPIDs := [1234, 4567, 1337]
global ClientCount := ClientPIDs.MaxIndex()
global StartingChannel := 2
global DelayMultiplier := 1.0

;Exits program if holding Shift
ExitCall()
{
	GetKeyState, state, Shift
	if state = D
		Exit
}

;Switches window focus to passed client
SwapClient(clientNum)
{
	ExitCall()
	
	temp := ClientPIDs[clientNum]
	WinActivate, ahk_pid %temp%
	WinWaitActive, ahk_pid %temp%
}

;Swaps to channel using system menu based on the channel passed (1 to 3)
SwapChannel(toChannel)
{
	ExitCall()
	
	Send, {ALT DOWN}{ALT UP}
	;Wait for UI Lag
	Sleep, 1350 * DelayMultiplier
	MouseClick, left,  1768,  1038
	Sleep, 250 * DelayMultiplier
	MouseClick, left,  1753,  977
	Sleep, 250 * DelayMultiplier
	MouseClick, left,  951,  459
	Sleep, 400 * DelayMultiplier
	
	ExitCall()
	
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
	
	ExitCall()

	Sleep, 500
	MouseClick, left,  907,  518
	Sleep, 300
	
	ExitCall()
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
		
		ExitCall()
		
		;Wait for the clients to load in
		Sleep, 10000
	}

	ExitCall()
}