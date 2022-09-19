pipeline{
    agent any
    tools{
    maven 'apache-maven-3.8.6'
    }
    stages{
        stage("GitClone"){
            steps{
                echo "GitClone"
               
                    git credentialsId: 'github', url: 'https://github.com/kusumaBE/docker.git'
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
                sh 'docker build -t kusumabe/myapp:latest .'
              }
            }
        stage('Docker Push') {
              steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                  sh 'docker push kusumabe/myapp:latest'
                }
              }
            }
          }
    }
