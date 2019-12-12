if (-not (Get-Module InvokeBuild)) {
    Import-Module InvokeBuild -ErrorAction SilentlyContinue
    if (-not (Get-Module InvokeBuild)) {
        Install-Module InvokeBuild -Scope CurrentUser -Force
        Import-Module InvokeBuild -ErrorAction Stop
    }
}

Invoke-Build @PSBoundParameters