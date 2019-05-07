#Requires -RunAsAdministrator

$file = "C:\_fileCopyTest.txt"
$folder = "C:\_fileCopyTest1000"

if (!(Test-Path $file))
{
   New-Item $file
}
else
{
  Write-Host -ForegroundColor Yellow  "Datei $file bereits angelegt!"
}

if (!(Test-Path $folder))
{
   New-Item -ItemType directory -Path $folder
}
else
{
  Write-Host -ForegroundColor Yellow  "Verzeichnis $folder bereits angelegt!"
}

for ($nr=1; $nr -le 1000; $nr++) 
{
    $destination = "C:\_fileCopyTest1000\test_$nr.txt"

    Copy-Item "$file" "$destination"

    $validate = Test-Path $destination

    echo "$destination `t exists now: $validate"
}