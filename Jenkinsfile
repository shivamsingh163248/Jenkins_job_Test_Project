pipeline {
  agent any

  tools {
    maven 'Maven 3.8.5'  // Configure in Jenkins global tools
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/shivamsingh163248/Jenkins_job_Test_Project.git'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean install'
      }
    }

    stage('Docker Build & Push') {
      steps {
        script {
          dockerImage = docker.build("your-dockerhub-username/springboot-app")
          docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-creds') {
            dockerImage.push("latest")
          }
        }
      }
    }
  }
}
