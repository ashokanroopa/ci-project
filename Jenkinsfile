pipeline {
    agent none

    stages {
        stage('Build') {
            agent any
            steps {
                echo "Stage running on ANY agent"
            }
        }

        stage('Test') {
            agent any
            steps {
                echo "Another stage running"
            }
        }
    }
}
