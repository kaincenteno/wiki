#Requires -RunAsAdministrator

$registry_path = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\PlayOnline*\InstallFolder"
$game_path = (Get-ItemPropertyValue -Path "${registry_path}" -Name '0001')
$pol_path = (Get-ItemPropertyValue -Path "${registry_path}" -Name '1000')
$pol_path = "${pol_path}\pol.exe"

$file_txt = @'
123456:654321:FTABLE.DAT
::

'@


if (Test-Path "${game_path}file.txt") {
    Remove-Item "${game_path}file.txt"
}

New-Item -Path $game_path -Name 'file.txt' -ItemType "file" -Value $file_txt

Start-Process -wait $pol_path
