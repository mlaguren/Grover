pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'ruby -v'
                sh 'bundler -v'
            }
        }
    }
}