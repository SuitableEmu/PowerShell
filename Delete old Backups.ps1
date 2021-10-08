#where the backups are located
$Folder = "Location"

#Delete files older than 6 months (or how long you want to keep the backup's 360 = 1 year 180 = 6 months etc)
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-180)} |
ForEach-Object {
   $_ | del -Force
   $_.FullName | Out-File 'Location\deletedlog.txt' -Append
}

#Delete empty folders and subfolders
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {$_.PsIsContainer -eq $True} |
? {$_.getfiles().count -eq 0} |
ForEach-Object {
    $_ | del -Force
    $_.FullName | Out-File 'Location\deletedlog.txt' -Append
}
