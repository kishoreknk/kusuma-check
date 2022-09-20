pipeline{
    agent any
    tools{
    maven 'Maven'
    }
    stages{
        stage("GitClone"){
            steps{
                echo "GitClone"
               
                    git credentialsId: 'github', url: 'https://github.com/kishoreknk/kusuma-check.git'
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
                sh 'docker build -t kishoreknk/myapp:latest .'
              }
            }
        stage('Docker Push') {
              steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                  sh 'docker push kishoreknk/myapp:latest'
                }
              }
            }
          }
    }
