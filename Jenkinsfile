pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'version=`cat .ruby-version`'
                sh 'rbenv install $version'
                sh 'rbenv local $version' 
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