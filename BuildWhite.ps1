$data = netstat -ano | findstr ESTABLISHED 


############################ Partial script borrowed and modified from François-Xavier @@ https://lazywinadmin.com/2014/08/powershell-parse-this-netstatexe.html
$test = FOREACH ($line in $data)
{
    
    # Remove the whitespace at the beginning on the line
    $line = $line -replace '^\s+', ''
    
    # Split on whitespaces characteres
    $line = $line -split '\s+'
    
    # Define Properties
    $properties = @{
        Protocol = $line[0]
        #LocalAddress = $line[1]
        ForeignAddress = $line[2]
        State = $line[3]
        PID = $line[4]
    }
    
    # Output object
    New-Object -TypeName PSObject -Property $properties 
}
############################ Partial script borrowed and modified from François-Xavier @@ https://lazywinadmin.com/2014/08/powershell-parse-this-netstatexe.html



$test | Out-File -FilePath C:\Users\Student\Desktop\whitelist.txt
Get-Content -Path C:\Users\Student\Desktop\whitelist.txt 