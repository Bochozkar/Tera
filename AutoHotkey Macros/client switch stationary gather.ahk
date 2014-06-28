;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS

global ClientPIDs := [6688, 7136, 9360, 4588, 9908, 10268, 11948] ;7996
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
	ControlSend, , F, ahk_pid %temp%
	;WinActivate, ahk_pid %temp%
	;WinWaitActive, ahk_pid %temp%
}

;Program
Sleep, 2000
Loop, 90
{
	;Gather on each client
	for index,PID in ClientPIDs
	{			
		SwapClient(index)
		Sleep, 100
	}
	
	;Wait for the nodes to respawn
	Loop, 35
	{
		Random, rand, 1000, 1050
		Sleep, %rand%
		ExitCall()
	}
}