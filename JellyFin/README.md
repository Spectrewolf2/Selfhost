### Jellyfin: Stream to any device from your own server, with no strings attached. Your media, your server, your way.

## Step 1:
Pull the Jellyfin image from Docker Hub.
```
sudo docker pull jellyfin/jellyfin
```
## Step 2:
Create a a Cache and Configuration Directory for Jellyfin. Be mindful of where you create these as you will have to reference them later. We will use these to bind folders from the host OS to the container OS.
```
mkdir jellyfin-config
mkdir jellyfin-cache
```

If you wish to use persistent volumes use these commands:
```
sudo docker volume create jellyfin-config
sudo docker volume create jellyfin-cache
```

## Step 3: Run the jellyfin container using this command.
```
sudo docker run -d \
 --name jellyfin \
 --user uid:gid \
 --net=host \
 --volume /path/to/config:/config \ # Alternatively --volume jellyfin-config:/config
 --volume /path/to/cache:/cache \ # Alternatively --volume jellyfin-cache:/cache
 --mount type=bind,source=/path/to/media,target=/media \
 --restart=unless-stopped \
 jellyfin/jellyfin
```


Bind Mounts are needed to pass folders from the host OS to the container OS whereas volumes are maintained by Docker and can be considered easier to backup and control by external programs. 
For a simple setup, it's considered easier to use Bind Mounts instead of volumes. Multiple media libraries can be bind mounted if needed:

```
--mount type=bind,source=/path/to/media1,target=/media1
--mount type=bind,source=/path/to/media2,target=/media2,readonly
...etc
```

Note:
The default network mode for Docker is bridge mode. Bridge mode will be used if host mode is omitted. Using host networking (--net=host) is optional but required in order to use DLNA.
