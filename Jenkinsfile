pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Assuming Maven is installed and available in the PATH
                    sh 'mvn clean install'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Build successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}

