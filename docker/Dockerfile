FROM jenkins/jenkins:alpine

USER jenkins
COPY --chown=jenkins:jenkins plugins /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
