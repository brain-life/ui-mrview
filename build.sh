set -e

tag=4

docker build -t soichih/vncserver-mrview .
docker tag soichih/vncserver-mrview soichih/vncserver-mrview:$tag
docker push soichih/vncserver-mrview #latest
docker push soichih/vncserver-mrview:$tag
