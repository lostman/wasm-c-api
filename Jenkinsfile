pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            args '-u root:root -v wasm-c-api-v8-cache:/code/wasm-c-api/v8'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'git config --global user.email "jenkins@dfinity.org"'
                sh 'git config --global user.name "Jenkins"'
                sh 'make v8-checkout'
                sh 'make v8'
                sh 'make clean && make C_COMP=gcc LD_FLAGS= C_FLAGS="-fPIC"'
            }
        }
    }
}
