# Spring Boot
Spring Boot allows you to configure how and when dependencies are provided to your application at runtime.

# Family Cash Card API 
- Spring MVC for the web application, 
- Spring Data for data access, and 
- Spring Security for authentication and authorization.

# IoC
Inversion of Control (IoC) containers manage the creation and lifecycle of objects in an application. They are a software design principle that helps promote modularity and decoupling in application development.

Inversion of Control is a principle in software engineering which transfers the control of objects or portions of a program to a container or framework. We most often use it in the context of object-oriented programming.

- IoC containers manage the requirements for creating object instances, and 
  take the responsibility for object creation and management away from the application code

- IoC containers can be implemented in a variety of ways, including Dependency Injection and Service Locator.

# Using Spring Initializr.
quickly and easily bootstrap a Spring Boot.

Link : https://start.spring.io/

STEP ONE 
Project : Maven or Gradle with YAML

# Use yaml with Gradle or Maven

# Load Yaml file like this
def yamlConfig = file('build.yml').text.toInputStream()
def config = new groovy.util.ConfigObject(yamlConfig)

