node {
    checkout scm
    stage('Preparation') {
        catchError(buildResult: 'SUCCESS') {
            sh 'docker stop rise-server'
            sh 'docker rm rise-server'
        }
    }
    stage('Build') {
        bash ./docker_deploy/applicationServer.sh
    }
}
