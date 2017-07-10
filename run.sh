
./build.sh

echo "running vnc server"
docker stop vncserver
docker rm vncserver

password=$RANDOM.$RANDOM.$RANDOM
echo "password: $password"

id=$(docker run -dP --name vncserver -e X11VNC_PASSWORD=$password -v /mnt/auto/dc2/projects/o3d/o3d-workflow:/input:ro soichih/vncserver-mrview)
hostport=$(docker port $id | cut -d " " -f 3)
echo "container $id using $hostport"

#TODO - pick a random port that's exposed on nginx
WEBSOCK_PORT=0.0.0.0:11010

echo "------------------------------------------------------------------------"
echo "http://dev1.soichi.us:11010/vnc_auto.html?password=$password"
echo "------------------------------------------------------------------------"

/usr/local/noVNC/utils/launch.sh --listen 11010 --vnc $hostport

