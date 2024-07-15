# JENKINS CICD

# STEP ONE - Create Persistant Volume for our Jenkins
Volume Name : Jen-Mav-Jav

# Command for creating volume
    - docker volume create Jen-Mav-Jav
# Command for checking volume
    - docker volume ls 

# # # #

# STEP TWO - Run docker for a jenkins server with our Jen-Mav-Jav volume
- Command for running Jenkins Server using docker
    - docker run -it -p 8181:8080 --name Jen-Java-Mav -v Jen-Mav-Jav:/var/jenkins_home jenkins/jenkins 
    - Link : http://localhost:8181/

- Accounr Credentials
    - User Name : Admin
    - Password  : Admin@69

# STEP THREE - Configure Maven