pipeline {
    agent any
    
    tools{
        maven '3.9.4'
    }
    
    environment {
        DOCKER_IMAGE = 'mounirad/springboot-jenkins'
    }
    

    stages {
        stage('Checkout Code') {
            steps {
                // Check out the source code from the version control system (Git)
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ad-munir/spring-boot-jenkins']])
            }
        }

        stage('Build and Test') {
            steps {
                // Build the Spring Boot application
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image for the Spring Boot application
                bat "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container for the application
                bat "docker run -d -p 8080:8080 $DOCKER_IMAGE"
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Authenticate to Docker registry if necessary
                    bat 'docker login -u mounirad -p mydocker@2023'
                    
                    // Tag the Docker image for Docker Hub
                    bat "docker tag $DOCKER_IMAGE mounirad/springboot-jenkins:latest"


                    // Push the Docker image to Docker Hub
                    bat 'docker push mounirad/springboot-jenkins:latest'
                }
            }
        }
    }
}
