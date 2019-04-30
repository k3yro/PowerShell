function Connect-RDP {
  param (
    [Parameter(Mandatory=$true)]
    $ComputerName,

    [System.Management.Automation.Credential()]
    $Credential
  )

  $ComputerName | ForEach-Object {
    if ($PSBoundParameters.ContainsKey('Credential'))
    {
      $User = $Credential.UserName
      $Password = $Credential.GetNetworkCredential().Password
      cmdkey.exe /generic:$_ /user:$User /pass:$Password
    }
    mstsc.exe /v $_ /f
  }
}

$secpasswd = ConvertTo-SecureString “geheim” -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential (“Administrator”, $secpasswd)

Connect-RDP 10.123.123.123 -Credential $mycreds