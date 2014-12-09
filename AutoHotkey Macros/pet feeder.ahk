;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS

global ClientPIDs := [102836, 99580, 100044, 99052] ;102836, 99580, 100044, 99052
global ClientCount := ClientPIDs.MaxIndex()

;Exits program if holding Shift
ExitCall()
{
	;GetKeyState, state, Shift
	;if state = D
	;	Exit
}

;Switches window focus to passed client
SwapClient(clientNum)
{
	ExitCall()
	
	temp := ClientPIDs[clientNum]
	ControlSend, , 6, ahk_pid %temp%
	Sleep, 3000
	ControlSend, , 6, ahk_pid %temp%
	Sleep, 3000
	ControlSend, , 8, ahk_pid %temp%
	Sleep, 3000
	;WinActivate, ahk_pid %temp%
	;WinWaitActive, ahk_pid %temp%
}

;Program
Sleep, 2000
Loop,
{
	;Feed pet on each client
	for index,PID in ClientPIDs
	{			
		SwapClient(index)
		Sleep, 10
	}
	
	;Wait for pet to be more hungry
	Sleep, 29 * 60 * 1000
	ExitCall()
}