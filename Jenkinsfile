pipeline {
    agent { label 'dockerbuilder' }
    stages {
        stage('Set Up Build Environment') {
            steps {
                sh 'workspace=`pwd`'
                sh 'docker run -v ${workspace}:/grover_workspace -i grover /bin/bash -c "bundle install --path vendor/bundle"'
            }
        }
    }
}
