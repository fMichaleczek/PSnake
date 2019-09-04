# DscProperty(Key): The property is required. The property is a key. The values of all properties marked as keys must combine to uniquely identify a resource instance within a configuration.
# DscProperty(Mandatory): The property is required.
# DscProperty(NotConfigurable): The property is read-only. Properties marked with this attribute cannot be set by a configuration, but are populated by the Get() method when present.
# DscProperty(): The property is configurable, but it is not required.
function Get-TargetResource {
    [DscResource()]
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [DscProperty(Key)]
        [parameter(Mandatory = $true)]
        [ValidateSet('Present', 'Absent')]      # This should translate into a validateMap in the MOF
        [System.String]
        $Ensure,

        [DscProperty(Mandatory)]
        [parameter(Mandatory = $true)]
        $Mandatory,

        [DscProperty()]
        [parameter()]
        [PSCredential]
        # Help message to add in MOF description
        $Optional, # should translate to [Write, EmbeddedInstance("MSFT_Credential")] String Optional; in the MOF

        #[DscProperty(NotConfigurable)] #This variable should not be used in the function's block, and not defined in Set/Test. Its only use is for the schema MOF
        [DscProperty( {
                param(

                    [DscProperty(Mandatory)]
                    [parameter(Mandatory = $true)]
                    $Property1
                )
            })]
        [parameter(hidden = $true)]
        [Microsoft.Management.Infrastructure.CimInstance]
        $somethingNotSettable
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $returnValue = @{
    Ensure = [System.String]
    InstallKey = [System.String]
    }

    $returnValue
    #>
}


function Set-TargetResource {
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]      # This should translate into a validateMap in the MOF
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        $Mandatory,

        [parameter()]
        [PSCredential]
        # Help message to add in MOF description
        $Optional # should translate to [Write, EmbeddedInstance("MSFT_Credential")] String Optional; in the MOF

    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."

    #Include this line if the resource requires a system reboot.
    #$global:DSCMachineStatus = 1


}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]      # This should translate into a validateMap in the MOF
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        $Mandatory,

        [parameter()]
        [PSCredential]
        # Help message to add in MOF description
        $Optional # should translate to [Write, EmbeddedInstance("MSFT_Credential")] String Optional; in the MOF

    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $result = [System.Boolean]

    $result
    #>
}


Export-ModuleMember -Function *-TargetResource
