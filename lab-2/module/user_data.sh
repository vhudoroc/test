#!/usr/bin/env bash

cd /home/ubuntu

cat <<EOF >  /tmp/index.html
<!DOCTYPE html>
<html>
<head>
<title>Cloud & DevOps: Let's talk about Infrastructure as Code?</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
        text-align: center;
    }
</style>
</head>
<body>

<h1>Welcome to nginx!</h1>

<p>This HTTP server is running as a Docker container named {{ container_name }} on server {{ hostname }}! :D</h2>

<p>
  <img src="logo.png" /><br/>
  <h3>The Developer's Conference Porto Alegre</h3>
</p>

</body>
</html>
EOF

apt-get install -y docker
sudo service docker start
sudo docker pull nginx
docker run -d -p 80:80 -v /tmp:/usr/share/nginx/html --name nginx nginx
sed -iE \"s/{{ hostname }}/`hostname`/g\" /tmp/index.html
sed -iE \"s/{{ container_name }}/nginx/g\" /tmp/index.html
