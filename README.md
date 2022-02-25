# Dockerfile for Jenkins Inbound Agent with Dotnet SDK

### Command reference

* Build tag after updating Dockerfile
```
docker build --tag docker-jenkins-dotnet-agent .
```

* Tag and push to dockerhub repository
```
docker tag docker-jenkins-dotnet-agent kentsarmiento/docker-jenkins-dotnet-agent
docker push kentsarmiento/docker-jenkins-dotnet-agent
```

* Run a container from image tag
```
docker run -d --name dotnet-agent-1 --init docker-jenkins-dotnet-agent -url http://jenkins-server:port -workDir=/home/jenkins/agent <secret> <agent_name>
```

* Access container via ssh
```
docker exec -it dotnet-agent-1 /bin/bash
```
