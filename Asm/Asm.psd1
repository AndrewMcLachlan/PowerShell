@{

RootModule = 'Path.psm1'
ModuleVersion = '1.0.0'
GUID = '50d90346-2ba7-47fc-97bd-725d1bb86d84'
Author = 'Andrew McLachlan'
Copyright = '(c) 2022 Andrew McLachlan. All rights reserved.'
Description = 'Useful tools'
CompatiblePSEditions = @('Core')
PowerShellVersion = '7.1'
#DotNetFrameworkVersion = '4.7.1'

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()

# Format files (.ps1xml) to be loaded when importing this module
#FormatsToProcess = ''

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Add-Path', 'Remove-Path')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = ''

        # A URL to the license for this module.
        LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/andrewmclachlan/PowerShell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
'@

    }

}

}
