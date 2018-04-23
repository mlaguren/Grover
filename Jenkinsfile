pipeline {
    agent { label 'ruby243' }

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'ruby -v'
                sh 'bundle -v'
                sh 'bundle install --path vendor/bundle'
            }
        }
        stage('Run Unit Tests & Generate RDOC') {
            steps {
                sh 'bundle exec rspec --format RspecJunitFormatter --out rspec.xml'
            }
        }       
        stage('Build Gem') {
            steps {
                sh 'gem build grover.gemspec'
                stash includes: '*.gem', name: 'grover'
            }
        }
        stage('Publish Gem To Gem Fury') {
            steps {
                build job: 'PublishToGemFury'
            }
        }
    post {
        always {
            junit 'rspec.xml'
            publishHTML (target: [allowMissing: false, alwaysLinkToLastBuild: false,keepAll: true,reportDir: 'coverage',reportFiles: 'index.html',reportName: "RCov Report"])
            cleanWs()
        }
    }
}
