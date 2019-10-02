pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
			    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    bat 'ant runTests >> log.txt'
					
                }
            }
		}
		stage('Stage 2') {
            steps {
				bat 'curl -d "grant_type=password&client_id=3MVG9Rd3qC6oMalWhbVCYXzU3BsrNv6czDGf6e8kjd2EE4DWjo7_HBn13WrXGBYGZl.6XKyfCOwZlEvJsUcZd&client_secret=4568422502070516129&username=slawekgolabek@gmail.com&password=!qazxsw2" -H "Content-Type: application/x-www-form-urlencoded" -X POST https://login.salesforce.com/services/oauth2/token'
				bat 'dir'
            }	
        }
    }
}

