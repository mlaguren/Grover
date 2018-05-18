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
                sh 'bundle exec rspec --format RspecJunitFormatter --out rspec.xml --format html --out results/rspec_results.html'
            }
        }       
        stage('Build Gem') {
            steps {
                sh 'gem build grover.gemspec'
                stash includes: '*.gem', name: 'grover'
            }
        }
        stage('Generate RDOC') {
            steps {
                sh 'bundle exec yard'
            }
        }
    }
        
    post {
        always {
            junit 'rspec.xml'
            publishHTML (target: [allowMissing: false, alwaysLinkToLastBuild: false,keepAll: true,reportDir: 'coverage',reportFiles: 'index.html',reportName: "RCov Report"])
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'doc', reportFiles: 'index.html', reportName: 'YARD For Grover', reportTitles: ''])
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'results', reportFiles: 'rspec_results.html', reportName: 'Unit Tests', reportTitles: ''])
            cleanWs()
        }
    }
}
