#NoEnv 
SetBatchLines -1
SendMode Input 
SetWorkingDir %A_ScriptDir%  
DetectHiddenWindows, On
#SingleInstance Force 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CHECK INTERNET ROUTINE

CheckNet:
{
	If (ConnectedToInternet() = 0)
	{
		MsgBox Internet not connected!
		goto, Quiter

	}
	ConnectedToInternet(flag=0x40)
	{
		Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",0)
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN ROUTINE

Gui 1:Add, Text,,Enter the link of Youtube video :
Gui 1:Add, Edit,  w115 y+10 vUrl w370,
Gui, Add, Radio, vVid, Video (mp4/mkv)
Gui, Add, Radio, vAud, Audio (mp3)
Gui 1:Add, Button, x+58 yp-5 gstart Default w85 , Download
Gui 1:Add, Button, x+10 yp gAbout w65 , About
Gui 1:Add, Button, x+10 yp gQuiter w65,Quit
Gui 1:Add, Text, w370 y+8 x10 vProg ,
GuiControl, , Prog, 
Gui 1:Show,,YouTubeDL v0.2.0
Return

Quiter:
GuiClose:
Exit:
	ExitApp
	
About:
	Gui, Submit,NoHide
	Gui 2: Add, Text,,`n⚫ A lite application to download video or audio from YouTube.`n`n⚫ Made By Akshay Parakh
	Gui 2: Add, Link,, ⚫ <a href="https://akshaycrazzy.github.io/YouTubeDownloader-AHK">Visit Website</a>
	Gui 2: Add, Text,,⚫ Version - 0.2.0`n
	Gui 2: show,NoActivate,About
	Gui 2: +AlwaysOnTop
	return

start:
{

	Gui, Submit,NoHide
	done=0
	GuiControl, , Prog, kk
	if url= 
	{
		MsgBox, Enter URL first!
		return
	}
	if (vid=1)
		type=1
	else if(aud=1)
		type=2
	else 
	{
		MsgBox, Select format first!
		return
	}
	FileDelete, %A_Temp%\get_video_info.txt
	FileDelete, %A_Temp%\get_prog.txt
	GuiControl, , Prog, Getting Metadata
	RunWait %comspec% /c "youtube-dl.exe -F %url% > %A_Temp%\get_video_info.txt",, hide
	global 1080p=137
	global 720p=136
	FHD:=0
	HD:=0
	GuiControl, , Prog, Video Metadata Imported
	Loop ,Read,%A_Temp%\get_video_info.txt
	{
		IfInString, A_LoopReadLine, %1080p%
			FHD=1
		IfInString, A_LoopReadLine, %720p%
			HD=1
	}
	if (type=1)
		goto, video
	else if(type=2)
		goto, audio
	
	
	
	
Progress:
{

	SetTimer, Progr, 100	
	Progr:
	{
		if (done=1)
		{
			GuiControl, , Prog, Finished Downloading
			goto, clear
		}
		else
		{
			
			Loop, read,%A_Temp%\get_prog.txt
			{ 
				lastline:= A_LoopReadLine
			}
			Needle := ": Downloading"
			If (FoundPos := InStr(lastline,Needle,CaseSensitive := true))
				prog:= SubStr(lastline, FoundPos+2)
			else
			{
				If (FoundPos := InStr(lastline," [ffmpeg]",CaseSensitive := true))
					prog:= SubStr(lastline, FoundPos+8)
				else
				{
					If (FoundPos := InStr(lastline, "Deleting",CaseSensitive := true))
					{
						prog:="Finished"
						done=1
					}
					else	
					{
						prog:= SubStr(lastline, 12)
					}
				}
			}
			GuiControl, , Prog, %prog%
		}
	}
	return
}	

	clear:
	{
		sleep, 10000
		GuiControl, , Prog,	
	}
	
	video:
	{		
		if(FHD=1)
		{			
			GuiControl, , Prog, Full HD 1080p (1920x1080) video available!
			Sleep, 3700
			Run %comspec% /c "youtube-dl.exe -f %1080p%+bestaudio %url% > %A_Temp%\get_prog.txt",,hide		
			goto, Progress
		}
		else if(HD=1)
		{
			GuiControl, , Prog, HD 720p (1280x720) video available!
			Sleep, 3700
			Run %comspec% /c "youtube-dl.exe -f %720p%+bestaudio %url% > %A_Temp%\get_prog.txt",,hide			
			goto, Progress
		}
		return
	}
	
	audio:
	{
		GuiControl, , Prog,  Audio (mp3) available!
		Sleep, 3700
		Run %comspec% /c "youtube-dl.exe -f bestaudio -x --audio-format mp3 --audio-quality 0 %url% > %A_Temp%\get_prog.txt",,hide
		goto, Progress
	}
	return
}
