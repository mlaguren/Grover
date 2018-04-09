pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'version=`cat .ruby-version` \ rbenv install $version \ rbenv local $version \ gem install bundler'
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