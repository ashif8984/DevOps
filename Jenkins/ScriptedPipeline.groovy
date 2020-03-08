
/*
Steps to run this script:

1. Create a new pipeline job from Jenkins
2. Add the below script in the pipeline Description part
3. Make sure you provide the correct github link where the .bat is present
4. Also create and add windows agent node in Manage Jenkins--> Manage Nodes
5. Run the script

*/




pipeline {
	agent { label 'New' } // New is the Windows Agent added to Managed Node in Jenkins 
	stages {
		stage ('Git Checkout') 		{
				steps {
					echo "GitHub Checkout Sucessfully"
					git 'https://github.com/ashif8984/DevOps/tree/master/Jenkins/jenkins_pipeline'

					  }	
				}

		stage ('Build') 		{
				steps {
					echo "Compiled Sucessfully"
					bat label: '', script: 'Build.bat'

					  }	
				}
		stage ('JUnit')	 		{
				steps {
					echo " Junit Passed Sucessfully"
					bat label: '', script: 'JUnit.bat'



					  }	
				}
		stage ('Quality-Gate')  {
				steps {
					echo " Quality Gate Passed Sucessfully"
					bat label: '', script: 'Quality.bat'
					

					  }
				}
		stage ('Deploy') 		{
				steps {
					echo " Pass"
					bat label: '', script: 'Deploy.bat'

					  }
				}
			}
		}