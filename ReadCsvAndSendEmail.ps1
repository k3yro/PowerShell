### Erzeuge Dateinamen anhand aktuellen Datum
$datum = (Get-Date).AddDays(0).ToString('dd.MM.yyyy')
$filename = "$datum" + "_dateiname.csv"

if(Test-Path "\\123.123.0.123\path\to\file\$filename" ) {

    ### Kopiere Datei (Anmeldung nicht gespeichert? -> Kommentar enfernen)
    #$pass="geheim"|ConvertTo-SecureString -AsPlainText -Force
    #$Cred = New-Object System.Management.Automation.PsCredential('username',$pass)
    #New-PSDrive -name j -Root \\123.123.0.123\path -Credential $cred -PSProvider filesystem
    Copy-Item -LiteralPath "\\123.123.0.123\path\to\file\$filename" -Destination "C:\path\to\file\$filename"
    #Remove-PSDrive -Name j

    ### Lies Datei
    $content = Get-Content -Path "C:\path\to\file\$filename"

    foreach($i in $content)
    {
        ### Pruefung (Text ersetzen mit Pruefstring!)
        if ($i -NotMatch 'Wenn dieser Text nicht vorhanden, dann sende Email ') 
        { 
            ### Sende Email bei Fehler
            $username   = 'error@example.com'
            $password   = 'geheim'
            $secstr     = New-Object -TypeName System.Security.SecureString
            $password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}

            $hash = @{
                from       = "script@example.com"
                to         = "error@example.com"
                subject    = "Oops! Da ist was schief gelaufen ;-)"
                smtpserver = "smtp.gmail.com"
                port       = "587"
                body       = "$i"
                credential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr
                usessl     = $true
                verbose    = $true
            }

            Send-MailMessage @hash
        }
    }
}