pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/YOUR_USERNAME/hangout-point.git'
            }
        }

        stage('Test') {
            steps {
                sh 'bash tests/test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t hangout-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 80:80 hangout-app'
            }
        }

        stage('Cleanup') {
            steps {
                sh '''
                    docker stop $(docker ps -q) || true
                    docker rm $(docker ps -aq) || true
                '''
            }
        }
    }
}
