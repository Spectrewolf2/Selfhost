# Check if the script is running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "The script is not running with administrative privileges. Restarting with elevated privileges..." -ForegroundColor Yellow

    # Relaunch the script with administrator privileges
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

# Inform the user about the WSL installation process
Write-Host "Starting the WSL installation process..." -ForegroundColor Green

# Execute the WSL installation command
try {
    wsl --install
    Write-Host "WSL installation command executed successfully. Follow any prompts to complete the installation." -ForegroundColor Green
} catch {
    Write-Host "An error occurred while trying to execute the WSL installation command." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
}

# Prevent the script from closing immediately
Write-Host "Press any key to exit..."
[void][System.Console]::ReadKey($true)
