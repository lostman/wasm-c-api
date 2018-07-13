node {
    checkout scm
    def dockerImage
    stage('Build Docker Image') {
        dockerImage = docker.build("wasm-c-api-build-image")
    }
    stage('Build wasm-c-api') {
        dockerImage.inside('-v hs-wasm-v8-stack-cache:/root/.stack') {
            sh 'git config --global user.email "jenkins@dfinity.org"'
            sh 'git config --global user.name "Jenkins"'
            sh 'make v8-checkout'
            sh 'make v8'
            sh 'make clean && make C_COMP=gcc LD_FLAGS= C_FLAGS="-fPIC"'
        }
    }
}
