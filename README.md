docker-nexus
======
Docker version of Sonatype Nexus

Usage
------
To run nexus:
```
docker run -d -p 8081:8081 --name nexus usman/docker-nexus
```

To backup nexus data:
```  
docker run --volumes-from nexus -v $(pwd):/backup ubuntu tar cvf /backup.tar /opt/sonatype-work/
```
