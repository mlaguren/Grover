pipeline {
    agent any

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'ruby -v'
                sh 'bundler -v'
                sh 'bundle install --path vendor/bundle'
            }
        }
        stage('Run Unit Tests & Generate RDOC') {
            steps {
                sh 'rspec spec'
            }
        }       
        stage('Build Gem') {
            steps {
                sh 'gem build hola.gemspec'
            }
        }
    }
}