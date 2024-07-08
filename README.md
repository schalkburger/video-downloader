# Video Downloader

PowerShell script that downloads any video URL that has been copied to your clipboard.

The default download directory is `%USERPROFILE%\Downloads`.

The default video download format is `mp4`.

## Requirements

- FFmpeg
- PowerShell

## How to use

Install [FFmpeg](https://www.ffmpeg.org/download.html) using your preferred package manager:

```
# Chocolatey
choco install ffmpeg

# winget
winget install --id=Gyan.FFmpeg  -e
```

Run the `.\video-downloader.ps1` script.