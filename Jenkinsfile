pipeline {
    agent any

    environment {
        IMAGE_NAME = "hangout-app"
        CONTAINER_NAME = "hangout-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sandeep007766/hangout-point.git'
            }
        }

        stage('Clean Old Container') {
            steps {
                script {
                    sh '''
                    docker rm -f $CONTAINER_NAME || true
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh '''
                    docker build -t $IMAGE_NAME .
                    '''
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh '''
                    if [ -f test.sh ]; then
                        chmod +x test.sh
                        ./test.sh
                    else
                        echo "No tests found, skipping..."
                    fi
                    '''
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh '''
                    docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment Successful'
        }

        failure {
            echo '❌ Pipeline Failed'
        }

        always {
            echo '🧹 Cleaning workspace'
            cleanWs()
        }
    }
}
