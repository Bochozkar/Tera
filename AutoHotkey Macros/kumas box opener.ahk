Sleep, 2000
Loop
{
	MouseClick, left,  936,  577
	Sleep, 5
	MouseClick, left,  935,  473
	Sleep, 5
	MouseClick, left,  942,  578
	Sleep, 5
	
	GetKeyState, state, Shift
	if state = D
		break
}