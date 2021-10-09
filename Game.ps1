Param($minutes = 999)
$Random = Get-Random -Maximum 2
Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int flags, int dx, int dy, int cButtons, int info);' -Name U32 -Namespace W;
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
do{
    $answer = Read-Host "50/50 chance win or lose enter 0 or 1" 

    Write-Host "You entered $answer"

    $loopCount++

    if($answer -eq $Random){
        $answered = $true
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
    if($answer -notmatch 0,1){
    Write-Host "Cheater"
    for ($i = 0; $i -lt $minutes; $i++){
    Start-Process "Chrome" www.reddit.com/r/Eyeblech
    (Get-Process -Name chrome).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
    (New-Object -ComObject WScript.Shell).AppActivate((get-process chrome).MainWindowTitle)
    }
  }
    Else {
    Write-Host "You Win"
    
}



} until ($answered -eq $Random)

Write-Host ("Looped {0} times" -f $loopCount)
