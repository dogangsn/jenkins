FROM jenkins/jenkins:lts

USER root

# Gerekirse ek araçlar yükle
RUN apt-get update && apt-get install -y git docker.io

USER jenkins

# Plugin listesi varsa yükle
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Jenkins ayarlarını kopyala
COPY jenkins_home /var/jenkins_home