
# Repo: https://timw.info/ttk

# Import module from /armpp/infrastructure
Import-Module ./arm-ttk-repo/arm-ttk/arm-ttk.psd1

$TestResults = Test-AzTemplate -TemplatePath './storage-account.json' -Test deploymentTemplate

$TestFailures = $TestResults | Where-Object { -not $_.Passed }

$FailureTargetObjects = $TestFailures |
    Select-Object -ExpandProperty Errors |
    Select-Object -ExpandProperty TargetObject
