 # About 
![Urbackup](https://portainer.io/images/logos/urbackup.png)
Urbackup server based on ubuntu image

# Volumes
 ``` 
"/var/urbackup": Configuration location 
"/var/log": Log location 
"/usr/share/urbackup": Backups location 
```
 # Ports 
``` 
55413 (TCP In): FastCGI for web interface.
55414 (TCP In): HTTP web interface.
55415 (TCP In): Internet clients.
35623 (UDP Out): UDP broadcasts for discovery.
``` 
# Usage 
``` 
docker run -d --name urbackup -v /var/urbackup:/var/urbackup -p 55413-55415:55413-55415 -p 35623:35623 flo313/urbackup-server
``` 
