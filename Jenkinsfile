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
                sh 'bundle exec rspec --format RspecJunitFormatter --out rspec.xml'
            }
        }       
        stage('Build Gem') {
            steps {
                sh 'gem build grover.gemspec'
            }
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