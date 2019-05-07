#Todo: build robocopy function
$_cTry = 10

#Allways end with "\"
$Directory = "C:\Folder1\" 
$Destination = "C:\Folder2\"

Function secureCopy
{
    Param(
    		[parameter(Position=0)]
    		$_cSrc,
    		[parameter(Position=1)]
    		$_cDest
    		)
            
    $_cTryCount+=1
    if($_cTryCount -ge $_cTry+1)
    {
        return
    }
    Try
    {
        Copy-Item "$_cSrc" "$_cDest" -ErrorAction Stop
        Remove-Item "$_cSrc"
    }
    Catch
    {
        echo "Kopieren fehlgeschlagen (Versuch $_cTryCount von $_cTry)" 
        echo "Neuer Versuch in 60 Sekunden..."
        Start-Sleep 60
        secureCopy "$_cSrc" "$_cDest"
    }
}


$files = Get-ChildItem "$Directory*" -Include *.mp4, *.avi -Name

foreach($file in $files)
{
	$_cTryCount = 0
	
	$temp_file_src = $Directory + $file
	$temp_file_dest = $Destination + $file

	secureCopy "$temp_file_src" "$temp_file_dest"
}

