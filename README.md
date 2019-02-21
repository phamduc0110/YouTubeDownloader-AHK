# YouTubeDownloader-AHK
A small utility to download videos from YouTube in maximum quality available.

<a href="https://i.giphy.com/media/mv7GMnolYgP5UH5pWV/source"><img src="https://i.giphy.com/media/mv7GMnolYgP5UH5pWV/source.gif" title="YouTube Video Downloader 0.1.0"/></a>

## Getting Started

This is a AHK Script for downloading videos from YouTube.

It will first check if you are connected to Internet, if not script will terminate itself.

Currently script only works for 720p or 1080p quality. (Whichever is available)

## Prerequisites
```
You don't need these if you are using executable, everything is included in the package. (YouTubeDL.exe)
```
Things you need to install for this script to work 

```
⚫ AutoHotkey
⚫ YouTubeDL.ahk (Main script)
⚫ FFmpeg.exe
⚫ youtube-dl.exe
```

## Installing

 * **If you are using the executable just run it and skip below steps**
 
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
  Enter the video URL to download 
  Example: https://www.youtube.com/watch?v=VORHQRG3Q_g
  ```
  
**STEP 3:**
```
  After Metadata is imported 
  Select the path to save the video.
  Example: ‪E:\Videos\Video Downloader
  (If you don't select any folder, the video will be saved to Desktop)
  ```
 
**STEP 4:** 
```
  Check the download progress on the opened command prompt window.
  ```
### Future Scope
Adding a proper GUI to the application.
Adding option to download audio only (.mp3 format)
Adding option to select quality of videos.

### Built With

* [AutoHotkey](https://www.autohotkey.com/) - Language Used
* [SciTE4AHK](http://fincs.ahk4.net/scite4ahk/) - Editor Used

### Versioning

* Current Version 0.1.0

### Authors

* **Akshay Parakh** - *Initial work* - [AkshayCraZzY](https://github.com/AkshayCraZzY)

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
