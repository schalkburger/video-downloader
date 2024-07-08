# Get the default directory from the user's profile
$defaultDirectory = "$env:USERPROFILE\Downloads"

# Prompt the user to enter a custom directory or press Enter to use the default
Write-Host "Enter your preferred download directory or press Enter to use the default ($defaultDirectory):"
$customDirectory = Read-Host

# Use the custom directory if provided, otherwise use the default
if ($customDirectory -ne '') {
    $downloadDirectory = $customDirectory
} else {
    $downloadDirectory = $defaultDirectory
}

# Check if the specified directory exists, create if it doesn't
if (-not (Test-Path -Path $downloadDirectory)) {
    New-Item -ItemType Directory -Path $downloadDirectory
    Write-Host "Directory created at: $downloadDirectory"
}

# Set the directory as the current location
Set-Location -Path $downloadDirectory

# Get the URL from the clipboard
$url = Get-Clipboard

# Check if a valid URL is present
if ($url -match '^https?://.*') {

    # Assuming $url contains the URL from the clipboard
    $formatArgument = '-f "mp4"'
    # Run yt-dlp with the URL
    Start-Process -FilePath "yt-dlp" -ArgumentList "$url $formatArgument" -Wait

    Write-Host "URL is" $url

    # Prompt the user to press any key to open the downloads folder and close the window
    Write-Host "`nPress any key to open the Downloads folder and close this window..."
    [System.Console]::ReadKey() | Out-Null

    # Open the specified download directory
    Invoke-Item $downloadDirectory
    Write-Host "`nOpening Downloads folder..."

    # Sleep for a moment to allow the folder to open before closing the script
    Start-Sleep -Seconds 2
} else {
    Write-Host "`nNo valid URL found in the clipboard.`n"
}

# Close the PowerShell window automatically
Write-Host "Closing window..."
exit
