; FKI Alert by Daniel Messer
; This programme monitors a computer for the FKI LibraryMate Alert window. When the window is detected
; this programme will call upon an e-mail shortcut to call for help. Ideally, this email
; shortcut should be directed toward an SMS address, but any email address should work.
ProcessNameSearch = javaw.exe
; DetectHiddenWindows, on ; Currently commented out because I don't think I WANT to find hidden windows.
WinGet, id, list,,, Program Manager ; Get all windows for the entire system.
Loop, %id%
{
	StringTrimRight, this_id, id%a_index%, 0
	WinGet, this_process, ProcessName, ahk_id %this_id%
	if this_process = %ProcessNameSearch%
	{
		WinGetTitle, this_title, ahk_id %this_id%
		Sleep, 5000
		Run f:\FKI_ALERT.url ;set this URL to be a mailto: address that Outlook will access.
		Sleep, 5000
		Send !s
		Sleep, 5000
		MsgBox, 0,, Problem detected with the FKI Self Checkin! Sending alert!
		IfMsgBox, Ok, break
	}

}	