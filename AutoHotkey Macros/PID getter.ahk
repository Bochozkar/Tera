WinGet, IDs, List, TERA

Loop, %IDs%
{
	current_id := IDs%A_Index%
	WinGet, current_pid, PID, ahk_id %current_id%
	FileAppend, %current_pid%`,` , PIDList.txt
}