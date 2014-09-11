;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS
;
;Type your message once so it can retype it by "enter up enter"

global ClientPID := 11232
global SecondsBetweenMessages := 300 ;seconds
global TimeBetweenKeystrokes := 1000 ;milleseconds, 5000 = 5 seconds


Sleep, 500

Loop
{
	ControlSend, , {ENTER}, ahk_pid %ClientPID%
	Sleep, TimeBetweenKeystrokes
	ControlSend, , {UP}, ahk_pid %ClientPID%
	Sleep, TimeBetweenKeystrokes
	ControlSend, , {ENTER}, ahk_pid %ClientPID%
	
	Sleep, SecondsBetweenMessages * 1000
}