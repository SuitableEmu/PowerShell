# Made by https://github.com/SuitableEmu/
$r = Get-Random -Maximum 2
Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W;
$wsh = New-Object -ComObject Wscript.Shell
$ok = $answer -ne $NULL
function Set-WindowStyle {
param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE', 
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED', 
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    $Style = 'SHOW',
    [Parameter()]
    $MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
)
    $WindowStates = @{
        FORCEMINIMIZE   = 11; HIDE            = 0
        MAXIMIZE        = 3;  MINIMIZE        = 6
        RESTORE         = 9;  SHOW            = 5
        SHOWDEFAULT     = 10; SHOWMAXIMIZED   = 3
        SHOWMINIMIZED   = 2;  SHOWMINNOACTIVE = 7
        SHOWNA          = 8;  SHOWNOACTIVATE  = 4
        SHOWNORMAL      = 1
    }
    Write-Verbose ("Set Window Style {1} on handle {0}" -f $MainWindowHandle, $($WindowStates[$style]))

    $Win32ShowWindowAsync = Add-Type –memberDefinition @” 
    [DllImport("user32.dll")] 
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru

    $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
}
function Win-Tune {

    [console]::beep(659,250) 
    [console]::beep(659,250) 
    [console]::beep(659,300) 
    [console]::beep(523,250) 
    [console]::beep(659,250) 
    [console]::beep(784,300) 
    [console]::beep(392,300) 
    [console]::beep(523,275) 
    [console]::beep(392,275) 
    [console]::beep(330,275) 
    [console]::beep(440,250)
    [console]::beep(494,250) 
    [console]::beep(466,275) 
    [console]::beep(440,275) 
    [console]::beep(392,275)
    [console]::beep(659,250) 
    [console]::beep(784,250)
    [console]::beep(880,275)
    [console]::beep(698,275)
    [console]::beep(784,225) 
    [console]::beep(659,250)
    [console]::beep(523,250)
    [console]::beep(587,225) 
    [console]::beep(494,225)


}

Do {
 $value = Read-host "50/50 chance win or lose enter 0 or 1"
if(($value -ne 1) -and ($value -ne 0)){      
         Write-Host "Cheater"
        for ($i = 0; $i -lt $minutes; $i++){
        Start-Process www.reddit.com/r/Eyeblech
        (Get-Process -Name chrome).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
        (New-Object -ComObject WScript.Shell).AppActivate((get-process chrome).MainWindowTitle) }

}
else {

}

}while (( $value -gt 1 ) -or ( $value -lt 0 )) 


do {

if($Value -eq $r) {
        Write-Host "You Won!"
        Win-Tune
        Break
}

else {
        Write-Host "You Lost"
        Start-Sleep 3
 for ($i = 0; $i -lt $minutes; $i++) {
    [W.U32]::mouse_event(6,0,0,0,0)
    Start-Process notepad.exe
    Write-Host "I clicked"
    (Get-Process -Name notepad).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
    (New-Object -ComObject WScript.Shell).AppActivate((get-process notepad).MainWindowTitle)
}

}
}until ($ok)     
