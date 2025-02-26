<#
    .SYNOPSIS
        Removes all merged Git branches from current repository.
#>
Function Remove-GitBranches
{
    [CmdletBinding()]
    param(
        [Alias("g")]
        [Parameter(Mandatory = $false)]
        [switch]$Gone,
        [Parameter(Mandatory = $false)]
        [switch]$Force,
        [Parameter(Mandatory = $false)]
        [switch]$WhatIf
    )

    if ($Gone)
    {
        $branches = git branch -vv | Where-Object{$_ -match ": gone"} | ForEach-Object{($_ -split "\s+")[1]} 
    }
    else
    {
        $branches = git branch --merged | Select-String -Pattern "(^\*|main|master)" -NotMatch
    }

    $switch = $Force ? "-D" : "-d"

    foreach ($branch in $branches)
    {
        $branchName = $branch.Line.Trim()
        Write-Host "Deleting branch: $branchName"
        if ($WhatIf) { continue }
        git branch $switch $branchName
    }
    #$branches | ForEach-Object | git branch -d $_.Line
}

Export-ModuleMember -Cmdlet Remove-GitBranches
