### Jellyfin: Stream to any device from your own server, with no strings attached. Your media, your server, your way.

## Jellyfin Website: https://jellyfin.org/
## Jellyfin Instructions: https://jellyfin.org/docs/general/installation/container



# Note: If you are running Jellyfin via Docker in WSL you need to expose the WSL instance ports to the Host system.
WSL2 runs inside a virtualized environment, and it uses a virtual network adapter with an IP address that is separate from your Windows host. This means that by default, WSL2 is not directly accessible from your Windows network unless you configure it to forward or expose the necessary ports.
When you're using Docker inside WSL2, your containers will listen on the WSL2 virtual IP (e.g., 172.x.x.x), not on the Windows network interface.

To access services in WSL2 (like Docker), you need to know the IP address assigned to the WSL2 instance.
Inside your WSL2 terminal (Linux shell), run:
```
ip addr show eth0
```
- Example: inet 172.20.50.5/20 — here, 172.20.50.5 is the WSL2 IP address.

# Configure Windows Firewall to Allow WSL2 Network Traffic
WSL2 can be isolated by the Windows firewall, so we need to allow traffic to flow between your Windows network and WSL2.
Open PowerShell as Administrator on Windows.
Allow inbound connections for the required ports by running the following commands:
    
```
netsh advfirewall firewall add rule name="Allow WSL2 traffic" protocol=TCP dir=in localport=8096 action=allow
netsh advfirewall firewall add rule name="Allow WSL2 traffic" protocol=TCP dir=in localport=8920 action=allow
```

These commands will allow traffic through port 8096 (Jellyfin's HTTP port) and 8920 (Jellyfin's HTTPS port) from the local network to your WSL2 instance.

# Set Up Port Forwarding in Windows (to Access Jellyfin from the Local Network)

Once you've obtained the WSL2 IP address and allowed inbound traffic through the firewall, the next step is to forward the necessary ports from your Windows machine to the WSL2 instance.
In this case, we'll forward port 8096 for HTTP access to Jellyfin.
Open a PowerShell window as Administrator and run the following command to set up port forwarding:
    
```
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8096 connectaddress=<wsl2-ip> connectport=8096
```

- wsl2-ip: Replace this with the IP you discovered earlier.
