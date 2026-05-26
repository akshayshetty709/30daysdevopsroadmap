pipeline {
    agent any

    environment {
        EC2_IP = "34.235.29.193"
    }

    stages {

        stage('clone backend repo') {
            steps {
                git branch: 'kreethi',
                    credentialsId: 'github-credentials',
                    url: 'https://github.com/cloudhostingky-alt/E-flow-Backend.git'
            }
        }

        stage('install & build') {
            steps {
                sshagent(credentials: ['ec2_key']) {

                    sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@${EC2_IP} '
                    set -e

                    rm -rf E-flow-Backend

                    git clone https://github.com/cloudhostingky-alt/E-flow-Backend.git

                    cd E-flow-Backend
                    git checkout kreethi
                    git pull origin kreethi

                    docker stop bkapp || true
                    docker rm bkapp || true
                    docker rmi bkimage || true

                    docker build -t bkimage .
                    docker run -d -p 3000:3000 --name bkapp bkimage
                    '
                    '''
                }
            }
        }
    }
}
