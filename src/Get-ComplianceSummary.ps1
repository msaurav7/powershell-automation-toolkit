function Get-ComplianceSummary {
    param([array]$Devices)
    $total = $Devices.Count
    $compliant = ($Devices | Where-Object { $_.Compliant -eq $true }).Count
    [PSCustomObject]@{
        Total             = $total
        Compliant         = $compliant
        NonCompliant      = $total - $compliant
        CompliancePercent = if ($total -gt 0) { [math]::Round(($compliant / $total) * 100, 2) } else { 0 }
    }
}
