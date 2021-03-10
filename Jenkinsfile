pipeline {
    agent any

    environment {
<<<<<<< HEAD
        AWS_ACCESS_KEY_ID     = credentials('aws_credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws_credentials')
=======
        AWS_ACCESS_KEY_ID     = credentials('jenkins_aws_key')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins_aws_key')
>>>>>>> main
        AWS_DEFAULT_REGION = ('us-east-1')
    }
    stages {
        stage('Cloudformation') {
            steps {
<<<<<<< HEAD
                sh "aws cloudformation create-stack --template-body 'file:///var/lib/jenkins/workspace/CNA_Finishlinelab1/finishlineinfra.yml' --stack-name 'FinislineLab1' --region 'us-east-1' --parameter ParameterKey=KeyName,ParameterValue=finishlinelab ParameterKey=InstanceType,ParameterValue=t2.micro"
=======
                sh "aws cloudformation create-stack --template-body 'file:///var/lib/jenkins/workspace/first_CI_Pipeline_finishlinelab3/Finishlinelab3/finishlinelab3infra.yaml' --stack-name 'FinislineLab3' --region 'us-east-1' --parameters file:///var/lib/jenkins/workspace/parameter.json"
>>>>>>> main
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