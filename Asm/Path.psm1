<#
   .SYNOPSIS
   Short description
   
   .DESCRIPTION
   Long description
   
   .PARAMETER path
   Parameter description
   
   .PARAMETER target
   Parameter description
   
   .EXAMPLE
   An example
   
   .NOTES
   General notes
   #>
Function Add-Path {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$path,
        [Parameter(Mandatory = $false)]
        [EnvironmentVariableTarget]$target = [EnvironmentVariableTarget]::User
    )

    begin {
        $existingPath = [Environment]::GetEnvironmentVariable("PATH", $target);
        $newPath = $existingPath.EndsWith(";") ? $existingPath : "$existingPath;";
    }

    process {
        if ($existingPath.Contains("$path;", [StringComparison]::OrdinalIgnoreCase)) {
            Write-Error "The PATH variable already contains $path"
            return
        }

        $newPath += $path + ";"
    }

    end {
        [Environment]::SetEnvironmentVariable("PATH", $newPath, $target)
    }
}

Function Remove-Path {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$path,
        [Parameter(Mandatory = $false)]
        [EnvironmentVariableTarget]$target = [EnvironmentVariableTarget]::User
    )
 
    begin {
        $existingPath = [Environment]::GetEnvironmentVariable("PATH", $target);
        $newPath = $existingPath
    }

    process {

        if (!$newPath.EndsWith($path, [StringComparison]::OrdinalIgnoreCase) -and !$newPath.Contains("$path;", [StringComparison]::OrdinalIgnoreCase)) {
            Write-Error "The PATH variable does not contains $path"
            return
        }

        if ($newPath.EndsWith($path, [StringComparison]::OrdinalIgnoreCase)) {
            $newPath = $newPath.Replace($path, "", [StringComparison]::OrdinalIgnoreCase)
        }

        $newPath = $newPath.Replace("$path;", "", [StringComparison]::OrdinalIgnoreCase)
    }

    end {
        [Environment]::SetEnvironmentVariable("PATH", $newPath, $target)
    }
}

Export-ModuleMember Add-Path, Remove-Path