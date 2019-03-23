# YouTubeDownloader-AHK
A lite application to download video and audio from YouTube in maximum quality available.

<a href="https://i.giphy.com/media/1wQtjGtlOmjDAm9GXb/source"><img src="https://i.giphy.com/media/1wQtjGtlOmjDAm9GXb/source.gif" title="YouTube Video Downloader 0.2.0"/></a>

## Getting Started

This is a AHK Script for downloading videos and music from YouTube.

It will first check if you are connected to Internet, if not script will terminate itself.

Currently script only works for 720p,1080p and mp3 (240kbps+) only.


## Prerequisites

Things you need to install for this script to work 

```
⚫ AutoHotkey
⚫ YouTubeDL.ahk (Main script)
⚫ FFmpeg.exe
⚫ youtube-dl.exe
```

## Installing
 
 **STEP 1 :**
  
 Download AHK (Required for running the script)
 
[Download AutoHotkey](https://www.autohotkey.com/download/ahk-install.exe) and install it.

**STEP 2 :**

  Download FFmpeg (Required for conversion and combining video and audio of video)
  
[Download FFmpeg](https://drive.google.com/uc?export=download&id=1jubMVolwxrZYRkVTspM9yyELNke-Mo85)

  Download youtube-dl (Required for downloading videos and audio)
  
[Download youtube-dl](https://github.com/AkshayCraZzY/YouTubeDownloader-AHK/raw/master/youtube-dl.exe)

  
[Code For YouTubeDL.ahk](https://raw.githubusercontent.com/AkshayCraZzY/YouTubeDownloader-AHK/master/YouTubeDL.ahk)

   ```
  After installing AutoHotkey
  
  1. Create a empty AHK script by right clicking anywhere on Desktop/Any Folder 
     after that select New > AutoHotkey Script
  
  2. Copy the code and paste it into the new script and save it as YouTubeDL.ahk
  
 ```
 
 **STEP 3:**

Copy all 3 files in same folder (Script won't work if these files are not in same folder)
   ```
   YouTubeDL.ahk
   FFmpeg.exe
   youtube-dl.exe
   ```

## Running the Script

**STEP 1 :**
 ```
  Double click on the YouTubeDL.ahk
  ```
 
**STEP 2 :**
```
  Enter the video URL to download and select between video/audio.
  ```
  
**STEP 3:**
```
  Choose format (Video/Audio) to download.
  ```
 
**STEP 4:** 
```
  Check the download progress and ETA on the GUI.
  ```
 **Video will be saved in the same folder in which script is present.**
 
### Future Scope

* Adding option to select quality of video and audio.

* Adding option to save the location for the video to be downloaded

* Improving GUI of application.


### Built With

* [AutoHotkey](https://www.autohotkey.com/) - Language Used
* [SciTE4AHK](http://fincs.ahk4.net/scite4ahk/) - Editor Used
* [CodeQuickTester](https://github.com/G33kDude/CodeQuickTester/) - Tester Used

### Versioning

* Current Stable Version Release 0.2.0

### Authors

* **Akshay Parakh** - *Initial work* - [AkshayCraZzY](https://github.com/AkshayCraZzY)

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
