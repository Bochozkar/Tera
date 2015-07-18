; Press and hold shift to end script

Sleep, 2000

Loop,
{
	Loop, 1500
	{
		GetKeyState, state, Shift
		if state = D
			break
		Sleep, 1000
		Send, F
	}
	Send, 2
}