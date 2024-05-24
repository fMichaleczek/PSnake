param (
    [Parameter()]
    [string]
    $BuildOutput = (property BuildOutput 'output'),

    [Parameter()]
    [string]
    $ProjectName = (property ProjectName ''),

    [Parameter()]
    $DeploymentTags = (property DeploymentTags ''),

    [Parameter()]
    $DeployConfig = (property DeployConfig 'Deploy.PSDeploy.ps1')
)

# Synopsis: Deploy everything configured in PSDeploy
task Deploy_with_PSDeploy {
    if ([System.String]::IsNullOrEmpty($ProjectName))
    {
        $ProjectName = Get-FactoryProjectName -BuildRoot $BuildRoot
    }

    $BuildOutput = Get-FactoryAbsolutePath -Path $BuildOutput -RelativeTo $BuildRoot
    $DeployFile = Get-FactoryAbsolutePath -Path $DeployConfig -RelativeTo $BuildRoot
    "Deploying Module based on $DeployConfig config"

    $InvokePSDeployArgs = @{
        Path  = $DeployFile
        Force = $true
    }

    if ($DeploymentTags)
    {
        $null = $InvokePSDeployArgs.Add('Tags', $DeploymentTags)
    }

    Import-Module PSDeploy
    Invoke-PSDeploy @InvokePSDeployArgs
}
