ClientCount := 2

;startup delay
Sleep, 5000

;Alt-Tabs between clients based on how many clients are open
AltTabFunc(clients)
{
	SetKeyDelay 30,50
	if clients = 2
		Send, {ALT DOWN}{TAB}{ALT UP}
	else if clients = 3
		Send, {ALT DOWN}{TAB}{TAB}{ALT UP}
	else if clients = 4
		Send, {ALT DOWN}{TAB}{TAB}{TAB}{ALT UP}
	else if clients = 5
		Send, {ALT DOWN}{TAB}{TAB}{TAB}{TAB}{ALT UP}
	else
	Sleep, 900
}

;Swaps to channel using system menu based on the channel passed (1 to 3)
SwapChannel(toChannel)
{
	Send, {ALT DOWN}{ALT UP}
	Sleep, 1000
	MouseClick, left,  1768,  1038
	Sleep, 200
	MouseClick, left,  1753,  977
	Sleep, 200
	MouseClick, left,  951,  459
	Sleep, 200
	
	if toChannel = 1
		MouseClick, left,  943,  477
	else if toChannel = 2
		MouseClick, left,  950,  498
	else if toChannel = 3
		MouseClick, left,  943,  514
		
	Sleep, 500
	MouseClick, left,  907,  518
	Sleep, 100
}

Loop
{
	Loop, %ClientCount%
	{
		;Gather on each client
		Send, F
		Sleep, 300
		AltTabFunc(%ClientCount%)
		
		;Swap channel on each client
		SwapChannel(1)
	}
	
	;Swap channels on clients
	Loop, %ClientCount%
	{
		SwapChannel(
	}
	
	Send, {ALT DOWN}{ALT UP}
	Sleep, 1000
	MouseClick, left,  1768,  1038
	Sleep, 200
	MouseClick, left,  1753,  977
	Sleep, 200
	MouseClick, left,  951,  459
	Sleep, 200
	SetKeyDelay 30,50
	Send, {ALT DOWN}{TAB}{ALT UP}
	Sleep, 900
	Send, {ALT DOWN}{ALT UP}
	Sleep, 1000
	MouseClick, left,  1768,  1038
	Sleep, 200
	MouseClick, left,  1753,  977
	Sleep, 200
	MouseClick, left,  951,  459
	Sleep, 200
	
	;Wait to load in
	Sleep, 10000

	;Stop if holding shift
	GetKeyState, state, Shift
	if state = D
		break
		
}