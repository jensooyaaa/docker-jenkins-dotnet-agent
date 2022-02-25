FROM jenkins/inbound-agent:latest-jdk8

USER root

# Install setup tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl git procps wget \
    && rm -rf /var/lib/apt/lists/*


# Install dotnet
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update \
  && apt-get install -y apt-transport-https \
  && apt-get update \
  && apt-get install -y dotnet-sdk-5.0

RUN apt-get update \
  && apt-get install -y apt-transport-https \
  && apt-get update \
  && apt-get install -y aspnetcore-runtime-5.0

RUN apt-get install -y dotnet-runtime-5.0


# Install other needed tools
RUN apt-get update \
  && apt-get -y install \
    openssh-client zip vim

ARG user=jenkins
USER ${user}

RUN dotnet tool install -g dotnet-reportgenerator-globaltool
RUN dotnet tool install -g SpecFlow.Plus.LivingDoc.CLI
ENV PATH="$PATH:/home/${user}/.dotnet/tools"


# Tester for created image, enable for testing
COPY ./test-dotnet.sh /usr/local/bin/test-dotnet.sh
ENTRYPOINT ["/usr/local/bin/test-dotnet.sh"]