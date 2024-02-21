pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t ${IMAGE} .'
            }
        }
        stage('Push') {
            steps {
                echo 'Testing..'
                sh 'chmod +x docker_push.sh'
                sh './docker_push.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker run -v /home/pratik/projects/popcorn-frontend:/app/dist --rm pratikgaikwad/${IMAGE}'
            }
        }
        stage('Remove') {
            steps {
                echo 'Removing Image....'
                sh 'docker rmi pratikgaikwad/${IMAGE}'
            }
        }
    }
}