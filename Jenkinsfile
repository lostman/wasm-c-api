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
                sh 'make v8-checkout'
                sh 'make v8'
            }
        }
    }
}
