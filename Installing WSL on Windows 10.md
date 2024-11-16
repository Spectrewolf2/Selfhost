# Installing WSL on Windows 10

Follow these steps to install the Windows Subsystem for Linux (WSL) on your Windows 10 computer using Powershell.

## Prerequisites

- Windows 10 version 1903 or higher
- Administrator access

## Installation Steps

### 1. Enable WSL Feature

1. Open Powershell as Administrator
2. Run the following command:

```
wsl --install
```

Note: By default it should install Ubuntu


### 2. Create a Default Unix User account. Note: The username does not need to match your Windows username.
1. Enter new UNIX username (all lowercase or you may see this error:)

```
err: Please enter a username matching the regular expression
            configured via the NAME_REGEX configuration variable.  Use the
            --allow-bad-names' option to relax this check or reconfigure           
            NAME_REGEX in configuration.
```

3. Enter a New Password. Note: The Password does not need to match your Windows username.
4. Confirm the New Password by typing it in again. Note: The Password does not need to match your Windows username.
5. You should see this output:
    
```Installation successful!
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 5.15.153.1-microsoft-standard-WSL2 x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro
```

### Complete: You are now running Ubuntu 22.04 on WSL.

## Additional Resources

- [Official Microsoft WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [WSL GitHub Repository](https://github.com/microsoft/WSL)
