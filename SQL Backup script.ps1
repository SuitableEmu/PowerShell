#You need to setup an "Backup Device" in SQL Management Studio before running the script

Backup-SqlDatabase -ServerInstance "APP\SQL Server Name" -Database "Database Name"

 Start-Sleep -s 3
 

$filenameFormat = "Name of backup" + " " + (Get-Date -Format "dd-MM-yyyy") + ".bak"


Move-Item -Path 'Location.bak' -Destination 'Destination'
Start-Sleep -s 3
Rename-Item -Path 'New path' -NewName $filenameFormat
