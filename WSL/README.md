# WSL Installation Guide for Windows 10

This repository provides a comprehensive guide for installing the Windows Subsystem for Linux (WSL) on Windows 10. WSL allows developers to run a Linux environment directly on Windows without the need for a virtual machine. Additionally, this repository includes a PowerShell script to automate the installation process.

## Features
- Step-by-step instructions for enabling WSL and installing Linux distributions.
- A PowerShell script to automate the installation of WSL and ensure compatibility.
- Self-elevating functionality within the script to run as an administrator automatically.

## Prerequisites
- A Windows 10 computer with version 1903 or later and Build 18362 or higher.
- Administrative privileges to enable required features and install components.

### Automated Installation Using the PowerShell Script
To simplify the process, you can use the included PowerShell script.

#### Steps:
1. Download the `InstallWSL.ps1` script from this repository.
2. Right-click the script and select **Run with PowerShell**.
3. The script will:
   - Check for administrative privileges and elevate itself if necessary.
   - Enable the required features.
   - Install WSL and set the default version to WSL 2.
4. Follow any prompts during the process.

## Script Features
- **Admin Privileges Check**: The script ensures it runs with administrative privileges and relaunches itself if needed.
- **Automatic Feature Enablement**: Enables the required WSL and Virtual Machine Platform features.
- **Pause for User Feedback**: Prevents the script from closing immediately, allowing users to review messages.

## How to Use
1. Clone or download this repository.
2. Execute the `InstallWSL.ps1` script in PowerShell.
## Instructions for Use of bootstrap.sh

1. Clone the repository and navigate to the `ubuntu` folder:
```bash
git clone https://github.com/Spectrewolf2/ubtunu
cd ubtunu
```

2. Make the script executable:
```bash
chmod +x bootstrap.sh
```

3. Run the script:
```bash
sudo ./bootstrap.sh
```
