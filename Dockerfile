FROM ubuntu:14.04
MAINTAINER Usman Ismail <usman@techtraits.com>
RUN apt-get -qq update
RUN apt-get -qq install openjdk-7-jre-headless
RUN apt-get -qq install wget
RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work /opt/sonatype-work/nexus
RUN ["wget", "-O", "/tmp/nexus-latest-bundle.tar.gz", "http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz"]
RUN tar -zxvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
RUN chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus /opt/sonatype-work/nexus
RUN sed -i 's/nexus-webapp-context-path=\/nexus/nexus-webapp-context-path=\//' /opt/sonatype-nexus/conf/nexus.properties

USER nexus

CMD ["/opt/sonatype-nexus/bin/nexus","console"]
VOLUME /opt/sonatype-work
EXPOSE 8081
