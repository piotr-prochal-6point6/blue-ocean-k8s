FROM jenkins/jenkins:alpine

USER jenkins
COPY --chown=jenkins:jenkins plugins /usr/share/jenkins/ref/plugins
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins
