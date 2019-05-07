//Als Administrator ausfuehren:
$ie = new-object -ComObject "InternetExplorer.Application"
$ie.visible = $true
$requestUri = "http://..."
$ie.navigate($requestUri)
while($ie.Busy) { Start-Sleep -Milliseconds 100 }

$elements = $ie.document.getElementsByName("...")

Foreach($element in $elements)
    {
        $element.value = "Username"
    } 

    $elements = $ie.document.getElementsByName("...")

Foreach($element in $elements)
    {
        $element.value = "Password"
    } 

	$commit = $ie.document.getElementsByTagName("input")| ? { $_.name -eq "NameLoginButton" }

$commit.click()
