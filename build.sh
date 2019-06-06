set -e
docker build -t soichih/vncserver-mrview .
docker tag soichih/vncserver-mrview soichih/vncserver-mrview:2
docker push soichih/vncserver-mrview:2
