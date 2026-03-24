pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo "Building the application..."
                sleep 5
            }
        }

        stage('Parallel Execution') {
            parallel {

                stage('Testing') {
                    steps {
                        echo "Running Tests..."
                        sleep 5
                    }
                }

                stage('Lint Check') {
                    steps {
                        echo "Checking Code Quality..."
                        sleep 5
                    }
                }

                stage('Security Scan') {
                    steps {
                        echo "Running Security Scan..."
                        sleep 5
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Application..."
            }
        }
    }
}
