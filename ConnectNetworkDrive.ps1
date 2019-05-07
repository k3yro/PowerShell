#get-help new-psdrive -detailed

#Verbinden Variante 1 (veraltet?):
$network = new-object -ComObject WScript.Network
$network.MapNetworkDrive("s:", "\\192.168.x.x\folder", $false, "domain\user", "geheim")
$infoS = Get-PSDrive s| Out-String
Write-Host -ForegroundColor Yellow $infoS
$network.RemoveNetworkDrive("s:")

#Verbinden Variante 2:
$password = ConvertTo-SecureString "geheim" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ("domain\user", $password)
$infoP = New-PSDrive -Name P -PSProvider FileSystem -Root \\192.168.x.x\folder -Credential $credentials -Persist | Out-String
Write-Host -ForegroundColor Yellow $infoP
Remove-PSDrive -name P -Force









