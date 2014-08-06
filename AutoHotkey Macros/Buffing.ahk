;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS

global ClientPID := 1216 ;6580
global Buffs := ["1", "2", "3", "5", "4", "="]

;Program
Sleep, 2000
Loop,
{
	
	for index,PID in Buffs
	{
		ControlSend, , %PID%, ahk_pid %ClientPID%
		Sleep, 2000
	}
	
	Sleep, 30000
	
}