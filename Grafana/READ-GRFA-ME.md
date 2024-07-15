# Setting up Grafana using Docker

# Step One Set Volume for Grafana
- Command for creating volume
    - docker volume create Grafolume
    - docker volume ls   # to list volume

- Command for Creating Grafana Instance
    - docker run -it -p 3000:3000 --name myGrafa-na -v Grafolume:/var/grafana_home grafana/grafana-enterprise
    - Link : http://localhost:3000/   # Graffana Online on This link. # UserName/Password is admin/admin
    
- ACCOUNT - Change Password to this
    - User Name : Admin
    - Password : Admin@69
