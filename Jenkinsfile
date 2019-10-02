pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
			    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    bat 'ant runTests >> log.txt'
					
                }
            }
		stage('Stage 2') {
            steps {
				def post = new URL("https://login.salesforce.com/services/oauth2/token").openConnection();
				def message = 'grant_type=password&client_id=3MVG9Rd3qC6oMalWhbVCYXzU3BsrNv6czDGf6e8kjd2EE4DWjo7_HBn13WrXGBYGZl.6XKyfCOwZlEvJsUcZd&client_secret=4568422502070516129&username=slawekgolabek@gmail.com&password=!qazxsw2'
				post.setRequestMethod("POST")
				post.setDoOutput(true)
				post.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
				post.getOutputStream().write(message.getBytes("UTF-8"));
				def postRC = post.getResponseCode();
				println(postRC);
				if(postRC.equals(200)) {
					println(post.getInputStream().getText());
				}
            }	
        }
    }
}

