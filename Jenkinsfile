import groovy.json.JsonSlurper
pipeline {
    agent any 
    stages {
		stage('Prepare Environment') {
            steps {
				script {
					if (fileExists("$JENKINS_HOME/email-templates/Summary.htm")) {
						new File("$JENKINS_HOME/email-templates/Summary.htm").delete()
					} else {
						println "Summary.htm file not found"
					}
                }
            }
		}
        stage('Get Class Errors') {
            steps {
			    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
					script {
						withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'sfdc.maindevorg.creds',
						usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
							stdout = bat(returnStdout: true, script: 'ant -Dsfdc.username='+USERNAME+' -Dsfdc.password='+PASSWORD+' runTests >> log.txt')
							def fileTableBat = stdout.split("\n")
							for (int i = 0; i < fileTableBat.size(); ++i) {
								println(fileTableBat[i])
							}
						}
					}
                }
            }
		}
		stage('Get Code Coverage') {
            steps {
				bat 'dir'
				script {
					withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'sfdc.maindevorg.creds',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
						def getToken = new URL("https://login.salesforce.com/services/oauth2/token").openConnection();
						def message = 'grant_type=password&client_id=3MVG9Rd3qC6oMalWhbVCYXzU3BsrNv6czDGf6e8kjd2EE4DWjo7_HBn13WrXGBYGZl.6XKyfCOwZlEvJsUcZd&client_secret=4568422502070516129&username='+USERNAME+'&password='+PASSWORD
						getToken.setRequestMethod("POST")
						getToken.setDoOutput(true)
						getToken.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
						getToken.getOutputStream().write(message.getBytes("UTF-8"));
						def getTokenRC = getToken.getResponseCode();
						println(getTokenRC);
						if(getTokenRC.equals(200)) {
							def jsonSlurper = new JsonSlurper()
							def token = jsonSlurper.parseText(getToken.getInputStream().getText())
							println(token.access_token);
							def getCodeCoverage = new URL("https://slawekgolabek-dev-ed.my.salesforce.com/services/data/v46.0/tooling/query?q=SELECT+ApexClassOrTriggerId,ApexClassOrTrigger.Name,NumLinesCovered,NumLinesUncovered+FROM+ApexCodeCoverageAggregate").openConnection();
							getCodeCoverage.setRequestMethod("GET")
							getCodeCoverage.setRequestProperty("Authorization", "Bearer " + token.access_token)
							getCodeCoverage.setRequestProperty("Content-Type", "text/plain; charset=UTF-8")
							def getCodeCoverageRC = getCodeCoverage.getResponseCode()
							println(getCodeCoverageRC)
							if(getCodeCoverageRC.equals(200)) {
								def codeCoverageJson = jsonSlurper.parseText(getCodeCoverage.getInputStream().getText())
								def percentageResult
								def emailBodyVar = "<body>Hello,<br /><br /><table><tr><th>Class Name</th><th>Coverage(%)</th></tr>"
								for (int i = 0; i < codeCoverageJson.records.size(); ++i) {
									if(codeCoverageJson.records[i].ApexClassOrTrigger != null) {
										percentageResult = (codeCoverageJson.records[i].NumLinesCovered + codeCoverageJson.records[i].NumLinesUncovered > 0) ? codeCoverageJson.records[i].NumLinesCovered * 100 / (codeCoverageJson.records[i].NumLinesCovered + codeCoverageJson.records[i].NumLinesUncovered) : 0
										emailBodyVar += "<tr><td>" + codeCoverageJson.records[i].ApexClassOrTrigger.Name + "</td><td>" + percentageResult.toInteger().toString() + "%</td></tr>"
									}
								}
								emailBodyVar += "</table>"
								File emailFile = new File("$JENKINS_HOME/email-templates/Summary.htm")
								emailFile.write emailBodyVar
							} else {
								println(getCodeCoverage.getStatus());
							}
						}
					}
				}
            }	
        }
		stage('Get Jenkins Log') {
            steps {
				script {
					def file = readFile "$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_ID/log"
					def fileTable = file.split("\n")
					def writingFlag = false
					def emailBodyVar = "<br /><table><tr><th>Failures</th></tr>"
					for (int i = 0; i < fileTable.size(); ++i) {
						if(fileTable[i].contains("*********** DEPLOYMENT FAILED ***********"))
							writingFlag = !writingFlag
						if(writingFlag) {
							emailBodyVar += "<tr><td>" + fileTable[i] + "</td></tr>"
						}
					}
					emailBodyVar += "</table><br /><br /><table><tr><td>Regards</td></tr><tr><td>Salesforce System Monitoring Team</td></tr></table></body>"
					if(emailBodyVar != "<br /><table><tr><th>Failures</th></tr></table></body>") {
						File emailFile = new File("$JENKINS_HOME/email-templates/Summary.htm")
						emailFile.append(emailBodyVar)
					}
				}
            }	
        }
		stage('Clean Workspace') {
            steps {
				bat 'dir'
				script {
					deleteDir()
				}
            }	
        }
    }
	post {
        always {
			script{
				def file = readFile "$JENKINS_HOME/email-templates/Summary.htm"
				emailext mimeType: 'text/html', attachLog: true, body: file, recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider'],[$class: 'UpstreamComitterRecipientProvider']], subject: 'Org Coverage Test Results - $JOB_NAME - $BUILD_ID'
			}
        }
    }
}

