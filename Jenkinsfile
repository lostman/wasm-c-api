node {
    checkout scm
    def dockerImage
    stage('Build Docker Image') {
        dockerImage = docker.build("wasm-c-api-build-image")
    }
    stage('Build wasm-c-api') {
        dockerImage.inside('-v wasm-c-api-v8-cache:/code/wasm-c-api/v8') {
            sh 'make v8-checkout'
            sh 'make v8'
            sh 'make clean && make C_COMP=gcc LD_FLAGS= C_FLAGS="-fPIC"'
        }
    }
}
