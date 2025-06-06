Function Get-Acronym() {
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    $Phrase -split " |-|_" | Foreach {"$($_[0])".ToUpper()} | Join-String
}