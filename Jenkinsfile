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
                sh 'bundle config gem.fury.io g2UgJs2Zzh5DHy9wesq5'
                sh 'bundle exec fury push *.gem'
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
