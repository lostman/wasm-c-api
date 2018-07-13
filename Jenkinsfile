node {
    checkout scm
    def dockerImage
    def workspace
    stage('Build Docker Image') {
        dockerImage = docker.build("wasm-c-api-build-image")
        workspace = pwd()
    }
    stage('Build wasm-c-api') {
        dockerImage.inside("-u root:root -v wasm-c-api-v8-cache:${workspace}/v8") {
            sh 'make v8-checkout'
            sh 'make v8'
            sh 'make clean && make C_COMP=gcc LD_FLAGS= C_FLAGS="-fPIC" WASM_INTERPRETER=/usr/local/bin/wasm'
        }
    }
}
