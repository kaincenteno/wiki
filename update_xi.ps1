#Requires -RunAsAdministrator

$game_path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\PlayOnlineUS\InstallFolder').'0001'
$pol_path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\PlayOnlineUS\InstallFolder').'1000'
$pol_path = "${pol_path}\pol.exe"

$file_txt = @'
123456:654321:FTABLE.DAT
::

'@


if (Get-Item ${game_path}file.txt) {
    Remove-Item "${game_path}file.txt"
}

New-Item -Path $game_path -Name 'file.txt' -ItemType "file" -Value $file_txt

Start-Process -wait $pol_path
