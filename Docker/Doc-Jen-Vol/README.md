# This Project Involves Docker Volume and Jenkins

- Created Docker Volume
    - cmd docker volume create jenkins-data

# # # #

- Creating Docker Container (LOCAL 9090)
    - cmd docker run -it --name JenkinsL -p 9090:8080 -v jenkins-data:/var/jenkins_home jenkins/jenkins
- Access 
    link : http://localhost:9090

# # # #

- Creating Docker Container (LOCAL 9091)
    - cmd docker run -it --name JenkinsL1 -p 9091:8080 -v jenkins-data:/var/jenkins_home jenkins/jenkins
- Access 
    link : http://localhost:9091

# # # #

- Account Details
    - User : ManE
    - Pass : mane@69

# Data is persistent throught different jenkins server in this case there are two port that are 9090 and 9091 respectively
# add for bind mount too
