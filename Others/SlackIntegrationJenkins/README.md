# Slack Integration with Jenkins Jobs

One of the popular method of Continuous Integration and Continous Delivery is ChatOps.
Instead of relying on the EMAIL to be notified to the developers or Busines in Continous Delivery Pipeline, using of Slack channel is growing popularity.

In such a case, entire history of the chats can be seen and what action has been taken can be viewed.

## Example: 

Server 'A' in goes down thereby Website is unaccessbile. Following series of Chats happend in Slack Channel.

1. Channel (say- CoAdmin) gets notification pop-up : ALERT: Server A is offline
2. Admin -X says: I am looking into it
3. Server A was restarted and slack channel gets another pop-up : ALERT : Server A is Online
4. Admin -X says: Everything is now all good

This way we not only get the history of events that occured, but also allows easy integration of many of the open source tools.

Lets bring this in Action:

## Scenario : 

Jenkins Job in a Continous Integration needs to have a proper channel to notify the Developers whenever there is BUILD Failed.
This way Developers can easily find out the bug at early stage of the development lifecycle.


## Objective: 

We want to have a stage in Jenkins pipeline whenever there is Failed Build , Developer get a message in their Slack Channel.


## Getting Started:

#### Step1: Inside your Jenkins , install a Pluing SlackNotification Plugin.

Note: Latest version of this plugin did not worked for me , so I installed the version 2.2 from Jenkins.IO/Archive 
link :https://updates.jenkins.io/download/plugins/slack/

#### Step2 Login to your Slack Channel and add app called: Incoming Webhoooks



#### Step3 : Configure Global Slack Notifier Settings under Manage Jenkins

```
Under Manage Jenkins > Confgure System > Global Slack Notifier Settings

Slack compatible app URL (optional) : https://hooks.slack.com/services/ (You can get this URL from the Incoming Webhooks page)
Team Subdomain: 7 digit number in the URL Incoming Webhooks page like - XXXXXXX in https://devops-XXXXXXX.slack.com

```

Create a new Credentials
 - Choose Kind : Secret Text
   Secret : The token after the Webhook URL after the /services/XXXXXXXXXXXXXXXXXXXXXXXXXX. paste only the tokem not the complete URL.
   ID, Description : Give any name like SlackCred
   Save 
Channell or Slack-Id : Choose the appropriate channel you want to notify to.

Test Connection : Success

#### Step4: Create a Jenkins Job of Pipeline type

Create a new Jenkins Pipeline job and insert the above script into it.
Save it

#### Step5 : Build the Job and verify the Slack Channel for the notification Received


### Contact me :

Contact | Link
------------- | -------------
LinkedIn:  |https://www.linkedin.com/in/ashif-eqbal-4ba85278/
Email:  | ashif8984@gmail.com