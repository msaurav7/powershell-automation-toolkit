BeforeAll { . "$PSScriptRoot/../src/Get-ComplianceSummary.ps1" }

Describe "Get-ComplianceSummary" {
    It "calculates compliance percentage correctly" {
        $devices = @(
            [PSCustomObject]@{Compliant=$true},
            [PSCustomObject]@{Compliant=$true},
            [PSCustomObject]@{Compliant=$false}
        )
        (Get-ComplianceSummary -Devices $devices).CompliancePercent | Should -Be 66.67
    }
}
