# Dockerfile for Jenkins Agent with Dotnet SDK

## References

* [Jenkins Agent](https://github.com/jenkinsci/docker-agent/blob/d636967c67aa27bb749cbf316d8a7b4cb46761fd/8/bullseye/Dockerfile)
* [Dotnet SDK](https://github.com/dotnet/dotnet-docker/blob/a5b98190e6b752e2967734b84033c1ec90ec855b/src/sdk/5.0/bullseye-slim/amd64/Dockerfile)

### Command reference

* Build tag after updating Dockerfile
```
PS C:\Users\kent\Development\Docker\docker-jenkins-dotnet-agent> docker build --tag docker-jenkins-dotnet-agent .
```

* Tag and push to dockerhub repository
```
PS C:\Users\kent\Development\Docker\docker-jenkins-dotnet-agent> docker tag docker-jenkins-dotnet-agent kentsarmiento/docker-jenkins-dotnet-agent
PS C:\Users\kent\Development\Docker\docker-jenkins-dotnet-agent> docker push kentsarmiento/docker-jenkins-dotnet-agent
```

* Run a container from image tag
```
PS C:\Users\kent\Development\Docker\docker-jenkins-dotnet-agent> docker run -i --rm --name agent1 --init -v agent1-workdir:/home/jenkins/agent docker-jenkins-dotnet-agent java -jar /usr/share/jenkins/agent.jar -workDir /home/jenkins/agent
```

* Access container via ssh
```
PS C:\Users\kent\Development\Docker\docker-jenkins-dotnet-agent> docker exec -it agent1 /bin/bash
```
