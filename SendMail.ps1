Try {
    $SMTPServer = "smtp.gmail.com" 
    $SMTPClient = New-Object Net.Mail.SMTPClient( $SmtpServer, 587 )  
    $SMTPClient.EnableSSL = $true 
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential( "jdoe@example.com", "geheim" ); 

    $emailMessage = New-Object System.Net.Mail.MailMessage
    $emailMessage.From = "max@example.com"
    $emailMessage.To.Add( "max@example.com" )

    $emailMessage.Subject = "Betreff"
    $emailMessage.Body = "Nachricht"

    $SMTPClient.Send( $emailMessage )
    
  
}
Catch {
    $Error[0] | select *
}

