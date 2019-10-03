pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install -q'
            }
        }
        stage('Deploy-Staging') {
            steps {
                sh './scripts/deploy-staging.sh'
            }
        }
        stage('Test-Staging') {
            steps {
                sh './scripts/test-staging.sh'
            }
        }
        stage('Deploy-Production') {
            steps {
                sh './scripts/deploy-production.sh'
            }
        }
        stage('Test-Production') {
            steps {
                sh './scripts/test-production.sh'
            }
        }
    }
}
