pipeline {
    agent { 
        docker { image 'grover_ruby:2.5.1' }
        }

    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'workspace=`pwd`'
                sh 'docker run -v ${workspace}:/grover_workspace -i grover /bin/bash -c 'bundle install --path vendor/bundle''
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
