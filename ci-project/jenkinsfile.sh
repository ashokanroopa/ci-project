pipeline {
    agent { label 'prod2' }

    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select environment')
        string(name: 'VERSION', defaultValue: '1.0', description: 'Enter version')
    }

    triggers {
        pollSCM('H/2 * * * *')
        cron('H/5 * * * *')
    }

    stages {

        stage('Build') {
            steps {
                echo "Building version ${params.VERSION}"
                sh 'bash app.sh'
            }
        }

        stage('Test') {
            steps {
                echo "Testing in ${params.ENV}"
                sh 'bash test.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying version ${params.VERSION} to ${params.ENV}"
                sh 'echo Deploying application...'
            }
        }
    }

    post {
        success {
            echo "Build Successful"
            archiveArtifacts artifacts: '*.sh', fingerprint: true
            build job: 'freestyle-demo'
        }

        always {
            script {
                currentBuild.description = "ENV=${params.ENV}, VERSION=${params.VERSION}"
            }
        }
    }
}
