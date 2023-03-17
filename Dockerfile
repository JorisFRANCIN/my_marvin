FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false --illegal-access=deny
ENV CASC_JENKINS_CONFIG /var/jenkins_home/my_marvin.yml
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY my_marvin.yml /var/jenkins_home/my_marvin.yml
COPY ./job_dsl.groovy ./job_dsl.groovy