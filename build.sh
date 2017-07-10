docker build -t soichih/vncserver-mrview .
if [ $? -eq 0 ];
then
    docker push soichih/vncserver-mrview
fi
