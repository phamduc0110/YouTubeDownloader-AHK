# YouTubeDownloader-AHK
A lite application to download video and audio from  YouTube and other websites.

<a href="https://i.giphy.com/media/U6vtkihY0IoQ0ikEDm/source"><img src="https://i.giphy.com/media/U6vtkihY0IoQ0ikEDm/source.gif" title="YouTube Video Downloader 0.4.0"/></a>

## Getting Started

This is a AHK Script for downloading videos and music from YouTube and other websites.

[*Total 1094 domains supported*](https://github.com/AkshayCraZzY/YouTubeDownloader-AHK/blob/master/SupportedSites.md)


## Prerequisites

Things you need to install for this script to work 

```
⚫ AutoHotkey
⚫ YouTubeDL.ahk (Main script)
⚫ FFmpeg.exe
⚫ youtube-dl.exe
⚫ phantomjs.exe (Optional - Only needed for webpages with JavaScript)
```

## Installing
 
 **STEP 1 :**
 
[Download AutoHotkey](https://www.autohotkey.com/download/ahk-install.exe) and install it. (Required for running the script)

**STEP 2 :**
  
[Download FFmpeg](https://drive.google.com/uc?export=download&id=1jubMVolwxrZYRkVTspM9yyELNke-Mo85) (Required for conversion and combining video and audio of video)
  
[Download youtube-dl](https://github.com/AkshayCraZzY/YouTubeDownloader-AHK/raw/master/youtube-dl.exe) (Required for downloading videos and audio)

***Optional -*** [Download phantomjs](https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-windows.zip) (Needed only for webpages which requires native JS extraction) 
  
  
Copy the code from [YouTubeDL.ahk](https://raw.githubusercontent.com/AkshayCraZzY/YouTubeDownloader-AHK/master/YouTubeDL.ahk)

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
   phantomjs.exe (Optional)
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
  Select the output folder to save the video and check if you want Fast Mode 
  
  If Fast Mode is checked skip STEP 4 
  ```
  ***Fast Mode - Skips the metadata import process required for choosing the quality for download instead it always downloads best quality avaiable (Works only for Youtube).***
 
**STEP 4:** 
```
  Wait for video parsing process to complete and select the quality in which you want to download. 
  ```

### Built With
* [youtube-dl](https://github.com/ytdl-org/youtube-dl) - Extractor Used
* [AutoHotkey](https://www.autohotkey.com/) - Language Used
* [SciTE4AHK](https://github.com/fincs/SciTE4AutoHotkey) - Editor Used
* [CodeQuickTester](https://github.com/G33kDude/CodeQuickTester/) - Tester Used

### Versioning

* Current Stable Version Release 0.4.0

### Authors

* **Akshay Parakh** - *Initial work* - [AkshayCraZzY](https://github.com/AkshayCraZzY)

### License

This project is licensed under the License - see the [LICENSE.md](LICENSE.md) file for details
