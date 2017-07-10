

docker stop vncserver
docker rm vncserver
docker run --name vncserver -p 5900:5900 -e X11VNC_PASSWORD=letitbe -v `pwd`/test:/input:ro -d soichih/vncserver-mrview

