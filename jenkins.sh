# Install using deb packages:
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
```
# Install required plug-ins:
```
JENKINS_URL="http://127.0.0.1:8080/"
USERNAME="admin"
PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
curl $JENKINS_URL/jnlpJars/jenkins-cli.jar -o jenkins-cli.jar
java -jar jenkins-cli.jar -s $JENKINS_URL install-plugin dashboard-view --username "$USERNAME" --password "$PASSWORD"
# Required for Bitbucket webhook
java -jar jenkins-cli.jar -s $JENKINS_URL install-plugin bitbucket --username "$USERNAME" --password "$PASSWORD"
# Required for using Aws Credentials
java -jar jenkins-cli.jar -s $JENKINS_URL install-plugin aws-credentials --username "$USERNAME" --password "$PASSWORD"
```