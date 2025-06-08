pipeline{
    agent any

    stages{
        stage('setup'){
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    pip install --upgrade pip
                    pip install pytest
                '''
            }
        }

        stage('run tests'){
            steps{
                echo 'Running pytest.....'
                sh '. .venv/bin/activate && pytest --junitxml=test-result.xml'
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