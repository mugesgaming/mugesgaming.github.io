# Remove temporary files
Remove-Item -Recurse -Force $env:temp\*

# Remove recycle bin files
Remove-Item -Recurse -Force $env:SystemDrive\$Recycle.bin -ErrorAction SilentlyContinue

# Remove Windows temporary files
Remove-Item -Recurse -Force $env:windir\Temp -ErrorAction SilentlyContinue

# Remove user temporary files
Get-ChildItem "C:\Users" -Directory | ForEach-Object {
    Remove-Item -Recurse -Force "$($_.FullName)\AppData\Local\Temp" -ErrorAction SilentlyContinue
}

# Remove Windows logs files
Remove-Item -Recurse -Force "$env:windir\*.log" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\*.log.*" -ErrorAction SilentlyContinue
