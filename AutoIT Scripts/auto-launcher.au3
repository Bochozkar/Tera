#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

	

Func Memory()
   $mem=ProcessGetStats(ProcessExists("TERA-Launcher.exe"),0)  
   Return $mem[0]  
EndFunc

$memory=0

$pid=ProcessExists("TERA-Launcher.exe")


If $pid Then
   ProcessClose($pid)
EndIf

While ProcessExists("TERA-Launcher.exe")
   Sleep(200)  
WEnd

ShellExecute("C:\Program Files (x86)\TERA\TERA-Launcher.exe")

While 1
   $mem=Memory()
   If $mem>60000000 Then
	  If $memory==$mem Then
		 $same=$same+1
	  Else
		 $same=0
	  EndIf
	  If $same==10 Then
		 ExitLoop
	  EndIf
   EndIf
   $memory=$mem
   Sleep(300)
WEnd

Sleep(1000)

ControlSend("TERA Launcher","","","test@mail.com")
Sleep(200)
ControlSend("TERA Launcher","","","{TAB}")
Sleep(200)
ControlSend("TERA Launcher","","","password")
Sleep(200)
ControlSend("TERA Launcher","","","{ENTER}")


Exit