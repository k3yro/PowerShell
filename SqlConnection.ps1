$Datenquelle = “10.0.1.123”                    
$Benutzer = “user”         
$Passwort = “geheim”                      
$Datenbank = “ExampleDb"                             

# Verbindung oeffnen
$Verbindung = New-Object System.Data.SqlClient.SqlConnection                   
$Verbindung.ConnectionString = "Server = $Datenquelle; Database = $Datenbank; User ID = $Benutzer; Password = $Passwort;"            
$Verbindung.Open()                

# Befehl absetzen
$Befehl = $Verbindung.CreateCommand()            
$Befehl.CommandText = “SELECT ...”        
          
$Resultat = $Befehl.ExecuteReader()                     
            
# Erstelle Data Table           
$Tabelle = new-object System.Data.DataTable                   
$Tabelle.Load($Resultat)              
                   
if($Tabelle.Rows.Count)
{
    $table = new-object System.Data.DataTable                   
    $table.Load($Resultat)
    
    $wert= $table.Rows[0]["wert"]

    Write-Host "Wert: $wert"
}

$Verbindung.Close() 

$pause = Read-Host

