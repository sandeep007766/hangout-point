pipeline {
    agent any

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sandeep007766/hangout-point.git'
            }
        }

        stage('Test') {
            steps {
                sh '''
                chmod +x test.sh
                ./test.sh
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t hangout-app .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker rm -f hangout-container || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d --name hangout-container -p 80:80 hangout-app
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline SUCCESS - App deployed successfully"
        }

        failure {
            echo "❌ Pipeline FAILED - Check logs"
        }

        always {
            cleanWs()
        }
    }
}
