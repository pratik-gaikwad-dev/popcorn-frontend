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
                sh 'docker tag ${IMAGE}:latest pratikgaikwad/${IMAGE}:latest'
                withCredentials([string(credentialsId: 'DOCKER_PASSWORD', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $MY_SECRET'
                    sh 'docker login -u ${DOCKER_USERNAME} -p $DOCKER_PASSWORD'
                }
                sh 'docker push pratikgaikwad/${IMAGE}'
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
    post {
        success {
            emailext attachLog: true, body: 'Email send from jenkins', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'pratik.gaikwad.dev@hotmail.com'
        }
        failure {
            emailext attachLog: true, body: 'Email send from jenkins', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'pratik.gaikwad.dev@hotmail.com'
        }
    }
}