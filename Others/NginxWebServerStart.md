

# To Restart the Nginx Web-Server hosting out Python Application

# If the application is deployed on AWS-Ubuntu Instance, they tend to change Public-IP on reboot of the instance/Instance Stop.

# To overcome this situation and cope up with it there are few steps need to take

1. Change the new IP in the below location

    $ cd/etc/nginx/sites-available/portfolio #portfolio is the applcaiotn name
    $ sudo nano portfolio
      # change the IP:
        server_name <ip_aws_instanace>;
    $ cd ~ home
    $ cd portfolio-project/portfolio/local_settings.py
       # chnage the IP

2. Reboot the server :
    $ sudo reboot now

3. Restart the NginX Server
    $sudo nginx -t && sudo systemctl restart nginx

4. Goto the URL in the browser and type the IP address:
    http://<IP>