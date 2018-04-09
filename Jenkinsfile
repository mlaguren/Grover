pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'rbenv install -l'
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