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
             sh "aws cloudformation create-stack --template-body 'file:///var/lib/jenkins/workspace/Finishlinelab4_finishlinelab4/finishlinelab4infra.yml' --stack-name 'FinislineLab4' --region 'us-east-1' --parameters ParameterKey=KeyName,ParameterValue=finishlinelab Parameterkey=InstanceType,ParameterValue=t2.small Parameterkey=DBName,ParameterValue=wordpress ParameterKey=DBUser,ParameterValue=wordpress Parameterkey=DBRootPassword,ParameterValue=wordpress"
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