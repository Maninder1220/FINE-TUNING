# JENKINS CICD
# START YOUR DOCKER DEMON / DOCKER DESKTOP


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

- Account Credentials
    - User Name : Admin
    - Password  : Admin@69

# STEP THREE - Configure Master and Slave
[MAKE SURE YOUR EC2 HAVE JAVA AND JENKINS INSTALLED AS PER DOCUMENTATION]

For Master -
I m using my local ubuntu, i initiated the jenkins server using docker and 
a dedicated docker volume so that our data persisit in the volume.

For Slave -
I m reusing my terraform networking infracture code with ec2 instance in public subnet, and
this ec2 will be our slave machine where our jobs will be running.

STEPS TO SETUP
- Launch EC2 and Connect
- Switch to Super user with command [sudo su]
- Use ssh-keygen to generate public and private key
- Set up slave using ssh key
- make dedicated dir in ec2 for Remote Root Directory [cd /opt]
- launch Method should be "Launch agents via SSH"
    - Host : IP of EC2   
    - Credential : Kind - SSH Username with private key
                   Username - root    <--- as we are using super user
                   Enter Private SSH Key
- Most IMP Part add public key to "authorized_keys"