# TF-ECS-FARGATE | Status : Completed

# AIM
Design the IaC (Terraform, Aws ECS/Fargate), CD pipeline using GitHub Actions.

# Whats Happning
In my Terraform Fargate IaC project, Amazon ECR plays a crucial role by allowing me to store, manage, and deploy my Docker container images seamlessly. It simplifies the image management process while providing built-in security features. This way, I can easily deploy my containerized applications without worrying about the underlying infrastructure.

Then there's Amazon ECS, which I rely on for orchestrating my containers. It takes the hassle out of managing clusters by allowing me to run containers effortlessly with Fargate. ECS handles the scheduling and deployment of tasks defined in my Task Definitions, ensuring everything runs smoothly.

I also utilize IAM Roles to define the permissions needed for my applications. By assigning the right IAM Role to my tasks, I ensure they have secure access to pull images from ECR, write logs to CloudWatch, and interact with other AWS services while following the principle of least privilege.

Finally, I define my Task Definitions to outline how my Docker containers should operate, including details like CPU and memory requirements. The Services I set up manage the deployment and scaling of these Task Definitions, making it easy to maintain the desired number of tasks running at all times. Together, these components create a cohesive architecture that enables me to deploy and manage my containerized applications efficiently and securely.







