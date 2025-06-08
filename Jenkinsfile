pipeline{
    agent any

    stages{
        stage('Setup and run script'){
            steps{
                sh 'chmod +x setup_env.sh'
                sh './setup_env.sh'
            }          
        }

        stage('publish reports'){
            steps{
                junit 'test-result.xml'
                archiveArtifacts artifacts: 'lint-report.txt, coverage.xml', fingerprint: true
            }
        }
    }
}