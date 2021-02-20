pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws_credentials')
        AWS_DEFAULT_REGION = ('us-east-1')
    }
    stages {
        stage('Cloudformation') {
            steps {
                sh "aws cloudformation create-stack --template-body 'file:///var/lib/jenkins/workspace/CNA_Finishlinelab1/finishlineinfra.yml' --stack-name 'FinislineLab1' --region 'us-east-1' --parameter ParameterKey=KeyName,ParameterValue=finishlinelab ParameterKey=InstanceType,ParameterValue=t2.micro"
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