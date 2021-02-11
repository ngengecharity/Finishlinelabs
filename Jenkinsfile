pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins_aws_key')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins_aws_key')
        AWS_DEFAULT_REGION = ('us-east-1')
    }
    stages {
        stage('Cloudformation') {
            steps {
                sh "aws cloudformation create-stack --template-body 'file:///var/lib/jenkins/workspace/first_CI_Pipeline_finishlinelab3/Finishlinelab3/finishlinelab3infra.yaml' --stack-name 'FinislineLab3' --region 'us-east-1' --parameters file:///var/lib/jenkins/workspace/parameter.json"
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}