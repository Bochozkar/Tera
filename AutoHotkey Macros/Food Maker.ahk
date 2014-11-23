Sleep, 2000
Loop
{
	ControlSend, , 1, ahk_pid 10868
	Sleep, 1000

	GetKeyState, state, Shift
	if state = D
		break
}