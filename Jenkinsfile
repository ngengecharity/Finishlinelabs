pipeline { 
    environment { 
        registry = "charityngenge/charity-boutgue" 
        registryCredential = 'docker_credentials' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Building our image') { 
            steps { 
              dir ('staticweb') {
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                  }
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}