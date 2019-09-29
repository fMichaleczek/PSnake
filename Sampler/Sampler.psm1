# This file is not needed, a COMPILED version will be built by ModuleBuilder
##Import Enums

foreach ($Enum in (Get-ChildItem "$PSScriptRoot\Enums" -ErrorAction SilentlyContinue)) {
    . $Enum
}

##Import Classes

foreach ($class in (Get-ChildItem "$PSScriptRoot\Classes" -ErrorAction SilentlyContinue)) {
    . $Class
}

#Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        Write-Verbose "Importing $($Import.FullName)"
        . $import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullName): $_"
    }
}

Export-ModuleMember -Function $Public.Basename