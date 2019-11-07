#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;
; Script Function:
;   Opens Notepad, types in some text and then quits.
;

;Terminates script if no command-line arguments
;Alternative:
If $CmdLine[0] = 0 Then
	MsgBox(0, "Process Trigger", "No command specified")
    Exit (12)
EndIf

ShellExecute($CmdLine[1], "", "", "", @SW_HIDE)

Exit (0)

; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)



; Finished!
