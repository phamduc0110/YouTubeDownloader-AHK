#NoEnv 
;#Warn 
SendMode Input 
SetWorkingDir %A_ScriptDir%  
#SingleInstance Force 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CHECK INTERNET ROUTINE
CheckNet:
{
/*
modified=20150830
aaa:= % IsInternetConnected()
if aaa=0
{
  msgbox, 262208,InternetCheck,Not Connected To Internet
  gosub, Exit
}
else
{ 
 ;Tooltip,Connected To Internet
  gosub, start
}
return
IsInternetConnected()
{
	static sz := A_IsUnicode ? 408 : 204, addrToStr := "Ws2_32\WSAAddressToString" (A_IsUnicode ? "W" : "A")
	VarSetCapacity(wsaData, 408)
	if DllCall("Ws2_32\WSAStartup", "UShort", 0x0202, "Ptr", &wsaData)
		return false
	if DllCall("Ws2_32\GetAddrInfoW", "wstr", "dns.msftncsi.com", "wstr", "http", "ptr", 0, "ptr*", results)
    {
		DllCall("Ws2_32\WSACleanup")
		return false
    }
	ai_family   := NumGet(results+4, 0, "int")               
	ai_addr     := Numget(results+16, 2*A_PtrSize, "ptr")      
	ai_addrlen  := Numget(results+16, 0, "ptr")             
	DllCall(addrToStr, "ptr", ai_addr, "uint", ai_addrlen, "ptr", 0, "str", wsaData, "uint*", 204)
	DllCall("Ws2_32\FreeAddrInfoW", "ptr", results)
	DllCall("Ws2_32\WSACleanup")
	xxx := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	F1:="http://www.msftncsi.com/ncsi.txt"
	F2:="http://ipv6.msftncsi.com/ncsi.txt"
	xxx.SetTimeouts(500,500,500,500)
	try 
	{
		if (ai_family = 2 && wsaData = "131.107.255.255:80")
		xxx.Open("GET",F1)
		else if (ai_family = 23 && wsaData = "[fd3e:4f5a:5b81::1]:80")
			xxx.Open("GET",F2)
		else
			return false
		xxx.Send()
		return (xxx.ResponseText = "Microsoft NCSI")
	}
	catch e 
	{
		xxxe:=e.Message
		msgbox, 262208,ERROR ,Error=Catch`n%f1%`n - or-`n%f2%`n------------------------------------------`n%xxxe%`n------------------------------------------`nit TRYS 	again ...,
    }
	return
}
*/

	If (ConnectedToInternet() = 0)
	{
		MsgBox Internet not connected!
		Return
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
Gui 1:Show
;Gui,+AlwaysOnTop
Return

Quiter:
GuiClose:
Exit:
	ExitApp
About:
	Gui, Submit,NoHide
	Msgbox, ⚫ A lite application to download video or audio from YouTube.`n⚫ Made By Akshay Parakh`n⚫ https://akshaycrazzy.github.io/YouTubeDownloader-AHK`n⚫ Version - 0.1.2-beta
	return

start:
{
	Gui, Submit,NoHide
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
	FileDelete, %A_Temp%\get_prog_info.txt
	SplashTextOn, , , Getting Metadata...
	RunWait %comspec% /c "youtube-dl.exe -F %url% > %A_Temp%\get_video_info.txt",, Hide
	global 1080p=137
	global 720p=136
	FHD:=0
	HD:=0
	SplashTextOff
	MsgBox, Video Metadata Imported!
	FileSelectFolder, OutputVar,, 3,Select Folder to download video 
	
	if OutputVar =
	{
		MsgBox, You didn't select a folder.`nVideo will be saved on Desktop.
		OutputVar=%A_Desktop%
	}
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
	
	video:
	{
		
		if(FHD=1)
		{
			MsgBox, 4,, Full HD 1080p (1920x1080) video available!`n(Press Yes to start downloading)
			IfMsgBox Yes
			{
				RunWait %comspec% /c "youtube-dl.exe -f %1080p%+bestaudio %url%"
				FileMove, %A_ScriptDir%\*.mp4, %OutputVar%\*.*
				FileMove, %A_ScriptDir%\*.mkv, %OutputVar%\*.*
				MsgBox, VIDEO DOWNLOADED!`nYoutube Downloader Made By AKSHAY PARAKH.
				goto, exit
			}
			else
				goto, exit
		}
		else if(HD=1)
		{
			MsgBox, 4,, HD 720p (1280x720) video available!`n(Press Yes to start downloading)
			IfMsgBox Yes
			{
				RunWait %comspec% /c "youtube-dl.exe -f %720p%+bestaudio %url%"
				FileMove, %A_ScriptDir%\*.mp4, %OutputVar%\*.*
				FileMove, %A_ScriptDir%\*.mkv, %OutputVar%\*.*
				MsgBox, VIDEO DOWNLOADED!`nYoutube Downloader Made By AKSHAY PARAKH.
				goto, exit
			}
			else
				goto, exit
		}
		return
	}
	audio:
	{
		MsgBox, 4,, Audio (mp3) available!`n(Press Yes to start downloading)
		IfMsgBox Yes
		{
			RunWait %comspec% /c "youtube-dl.exe -f bestaudio -x --audio-format mp3 --audio-quality 0 %url%"
			FileMove, %A_ScriptDir%\*.mp3, %OutputVar%\*.*
			MsgBox, AUDIO DOWNLOADED!`nYoutube Downloader Made By AKSHAY PARAKH.
			goto, exit
		}
			else
				goto, exit
	}
	return
}
