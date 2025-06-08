pipeline{
    agent any

    stages{
        stage('setup'){
            steps{
                echo 'Creating python virtual environment.....'
                sh 'python3 -m venv venv'
                sh '.venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('run tests'){
            steps{
                echo 'Running pytest.....'
                sh '.venv/bin/activate && pytest --junitxml=test-result.xml'
            }
        }

        stage('Archive'){
            steps{
                junit 'test-result.xml'
            }
        }
    }

    post{
        always{
            echo 'pipeline completed.....'
        }
    }
}