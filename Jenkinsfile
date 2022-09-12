pipeline{
    agent any
//     agent{
//         node {
//         label 'new-agent'
//         customWorkspace '/home/ubuntu/workspace'
//     }
    }
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
        
//         stage("deploy"){
//             steps{
//                 echo "Deploy Step"
//                 deploy adapters: [tomcat9(credentialsId: 'tomcat9', path: '', url: 'http://18.144.163.23:9090')], contextPath: null, war: '*/*.war'
                
//             }
//         }
    }
    
}


stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t smithun/myapp:latest .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
        	sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
          sh 'docker push smithun/myapp:latest'
        }
      }
    }
  }
}
