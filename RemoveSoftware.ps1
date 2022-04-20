
function Get-SoftList {
    param (
          [Parameter()]
          [System.Object]
          $comps             
    )
    
    $softList = Get-WmiObject -Class win32_Product -ComputerName $comps | Select-Object -Property Name, Version, PSComputerName, InstallLocation
    return $softList
      
    
}

$comps = (Get-ADComputer -filter 'operatingsystem -like "*server*"').Name

Get-SoftList($comps)