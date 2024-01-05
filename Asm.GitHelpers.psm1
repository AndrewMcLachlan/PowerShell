Function Remove-GitBranches
{
    [CmdletBinding()]

    $branches = git branch --merged | Select-String -Pattern "(^\*|main)" -NotMatch

    $branches | ForEach-Object | git branch -d $_.Line
}

Export-ModuleMember Remove-GitBranches
