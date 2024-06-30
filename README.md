# puma-wrapper
RVM wrapper + instructions to boot puma web server on correct environment without unwanted encounters

1. add the script to correct location
```
/usr/local/bin/puma_wrapper/start_puma.sh
```

2. make it executable
```
sudo chmod +x /usr/local/bin/puma_wrapper/start_puma.sh
```

3. go to sys daemon
```
sudo nano /etc/systemd/system/puma.service
```

4. it should look something like this (<b>make sure user groups and paths are correct</b>)
```
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
User=puma
Group=puma
WorkingDirectory=/var/www/my-app
ExecStart=/usr/local/bin/puma_wrapper/start_puma.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

5. reload systemd and puma service
```
sudo systemctl daemon-reload

sudo systemctl restart puma
sudo systemctl status puma
```

6. verify that there are no errors
```
sudo systemctl status puma
```
7. make sure to allow traffic on correct port
```
sudo ufw status
sudo ufw allow your_port_number
sudo ufw reload
```

8. <b>ADDITIONAL:</b> debugging potential errors:
```
journalctl -u puma.service

# check nginx / apache error logs
sudo tail -f /var/log/nginx/error.log
```