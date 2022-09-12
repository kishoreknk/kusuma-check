pipeline{
    agent any
    tools{
    maven 'maven3.8.6'
    }
    stages{
        stage("GitClone"){
            steps{
                echo "GitClone"
               
                    git credentialsId: 'github', url: 'https://github.com/mithunmarvel/DevOps_Project.git'
                    }
                
            }
        stage("Maven Build"){
            steps{
                echo "Maven Build"

                sh 'mvn clean install'

            
            }
        }
        

        stage('Docker Build') {
              steps {
                sh 'docker build -t smithun/myapp:latest .'
              }
            }
        stage('Docker Push') {
              steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                  sh 'docker push smithun/myapp:latest'
                }
              }
            }
          }
    }
