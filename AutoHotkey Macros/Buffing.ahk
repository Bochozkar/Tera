;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS

global ClientPID := 10464
global Buffs := ["1", "2", "3", "5", "4", "="]
global StartupText := ["initializing buff mode...", "buff mode; activated - prepare for buffs", "please stand close for buffs if you would like them, i aim to serve you for all of your cute elin adventures o;"]

Sleep, 500
;StartupText()
Sleep, 500
BuffLoop()

StartupText()
{
	for index,textNum in StartupText
	{
		ControlSend, , {ENTER}, ahk_pid %ClientPID%
		Sleep, 250
		ControlSend, , %textNum%, ahk_pid %ClientPID%
		Sleep, 250
		ControlSend, , {ENTER}, ahk_pid %ClientPID%
		Sleep, 250
	}
}

BuffLoop()
{
	Loop,
	{
		
		for index,PID in Buffs
		{
			ControlSend, , %PID%, ahk_pid %ClientPID%
			Sleep, 2000
		}
		
		Sleep, 15000
		
	}
}