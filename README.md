
# About
![Urbackup](https://portainer.io/images/logos/urbackup.png)
Urbackup server based on Alpine Linux container
# Volumes 
``` 
 "/var/urbackup": Configuration location
 "/var/log": Log location
 "/usr/share/urbackup": Backups location
``` 
# Ports 
``` 
Port
Usage   
Incoming/Outgoing   
Protocol     
55413   
FastCGI for web interface   
Incoming   
TCP     
55414   
HTTP web interface   
Incoming   
TCP     
55415   
Internet clients   
Incoming   
TCP     
35623   
UDP broadcasts for discovery   
Outgoing   
UDP 

``` 
# Usage 
``` 
 docker run -d --name urbackup -v /var/urbackup:/var/urbackup -p 55413-55415:55413-55415 -p 35623:35623 flo313/urbackup-alpine
 ``` 
