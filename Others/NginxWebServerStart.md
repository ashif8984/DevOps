## Restart Nginx Web-Server for Python Django Application
If the application is deployed on AWS-Ubuntu Instance, they tend to change Public-IP on reboot of the instance/Instance Stop.
For more ref: https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04

### Getting started

> To overcome this situation and cope up with it there are few steps need to take

##### Step 1: Start the Ubuntu-Server instance hosted in AWS that contains your code

##### Step 2: Update the public IP of the Ubuntu instance in the below location
>SSH to the instance and navigate to below location
```
$ ssh ubuntu@<ip>
```
>Login via the User created for Deployment
```
$ su djangodeploy   # username
```
> Now change the IP in the Nginx Configuration File
```
$ cd 
$ cd /etc/nginx/sites-available
$ sudo nano portfolio  # portfolio is the project name
    server_name <ip_aws_instanace>;
Save and close the file
```
> Change the IP in the setting.py file under ALLOWED_HOSTS
```
$ cd ~ home
$ cd portfolio-project/portfolio  # path to the project directory
$ sudo nano settings.py 
    ALLOWED_HOSTS = ['<ip_aws_instanace>']
Save and close the file
```
##### Step 3: Reboot to the server (from terminal) to apply the changes
``` 
# reboot the server
$ sudo reboot now
```
> Wait for the server to be Up and again login via the Deploy user
```
$ su djangodeploy   # username
```

##### Step 4: Restart the NginX Server
```
$ sudo nginx -t 
$ sudo systemctl restart nginx
```

##### Step 5: Goto the URL in the browser and type the IP address:

```
http://<ip_aws_instanace>
```
### Contact me :

Contact | Link
------------- | -------------
LinkedIn:  |https://www.linkedin.com/in/ashif-eqbal-4ba85278/
Email:  | ashif8984@gmail.com
