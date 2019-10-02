pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
			    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    bat 'ant runTests'
                }
            }
        }
    }
}