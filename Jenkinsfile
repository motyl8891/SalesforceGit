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
				script {
                    def post = new URL("https://httpbin.org/post").openConnection();
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
		stage('Stage 3') {
            steps {
				bat 'curl -i -H "Content-Type: text/plain; charset=UTF-8" -H "Authorization: Bearer 00D24000000IMqM!AQ0AQOKr1m36U6rmTdQzl7v5qfG_J0q.1oR.RSkvmezlDWWeyxEfU.HpkIY72GkG3D80n6I9KVEak49PEEca6ysxbgU9BCx3" https://slawekgolabek-dev-ed.my.salesforce.com/services/data/v46.0/tooling/query?q=SELECT+ApexClassOrTriggerId,ApexClassOrTrigger.Name,NumLinesCovered,NumLinesUncovered+FROM+ApexCodeCoverageAggregate -o codeCoverage.txt'
				bat 'dir'
            }	
        }
    }
}

