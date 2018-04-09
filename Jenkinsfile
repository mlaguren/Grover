pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'gem install bundler'
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