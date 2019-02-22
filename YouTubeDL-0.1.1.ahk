#NoEnv 
#Warn 
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

start:
{
	InputBox, url, Enter Video Url, Enter the link of video to download.
	if url= 
		goto, exit
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
	InputBox, type, You want to download video or audio?, Enter 1 for video (mp4/mkv)`nEnter 2 for audio (mp3)
	FileSelectFolder, OutputVar,, 3,Select Folder to download video 
	
	if OutputVar =
	{
		MsgBox, You didn't select a folder.`nVideo will be saved on Desktop.
		OutputVar=%A_Desktop%
	}
	/*
	Loop ,Read,%A_Temp%\get_video_info.txt
	{
		;tooltip %A_LoopReadLine%
		form:=A_LoopReadLine
		IfInString, A_LoopReadLine, mp4
		{
			FileAppend %form% `n,%A_Temp%\Format.txt
		}
	}
	*/
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
			}
			else
				goto, exit
			/*
			MsgBox, Full HD 1080p (1920x1080) video available!`nDownloading...
			RunWait %comspec% /c "youtube-dl.exe -f %1080p%+bestaudio %url%"
			FileMove, A_ScriptDir\*.mp4, %OutputVar%\*.*
			MsgBox, VIDEO DOWNLOADED!`nYoutube Downloader Made By AKSHAY PARAKH.
			*/
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
			;MsgBox, Mp3 format.`nDownloading...
			RunWait %comspec% /c "youtube-dl.exe -f bestaudio -x --audio-format mp3 --audio-quality 0 %url%"
			FileMove, %A_ScriptDir%\*.mp3, %OutputVar%\*.*
			MsgBox, AUDIO DOWNLOADED!`nYoutube Downloader Made By AKSHAY PARAKH.
		}
			else
				goto, exit
	}
	return
}
Exit:
	msgbox Closed
	ExitApp
