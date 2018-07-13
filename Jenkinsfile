pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            args '-v wasm-c-api-v8-cache:/code/wasm-c-api/v8'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'make v8'
            }
        }
    }
}
