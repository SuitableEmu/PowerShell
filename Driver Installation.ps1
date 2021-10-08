$dir ="C:\temp" 
if (!(Test-Path $dir)) {New-Item -Path $dir -ItemType container}
#change URL depending on what grahics card you have, will add a check and get latest driver at some point.
$url = "us.download.nvidia.com/Windows/Quadro_Certified/452.57/452.57-quadro-desktop-notebook-win10-64bit-international-dch-whql.exe" 
$outpath = "$dir\Nvidia Driver.exe"
Add-Type -AssemblyName System.Windows.Forms
$UserResponse= [System.Windows.Forms.MessageBox]::Show("Do you want to downaload the driver?." , "Status" , 4)

if ($UserResponse -eq "YES" ) 
{

Invoke-WebRequest -Uri $url -OutFile $outpath -ErrorAction SilentlyContinue

} 

else 

{ 

#No activity

} 

$UserResponse= [System.Windows.Forms.MessageBox]::Show("Do you want to install the driver?." , "Status" , 4)

if ($UserResponse -eq "YES" ) 
{

Start-Process -FilePath "C:temp\Nvidia Driver.exe" 

} 

else 

{ 

#No activity

} 
