# Info for updating a project

# Remove old containers if exists:

docker_work=$(sudo docker ps --all | grep shark_container | awk {'print $1" "$2'})
if [ ! -z "${docker_work}" ]; then
	sudo docker stop $(echo ${docker_work} | cut -d ' ' -f1)
	sudo docker rm $(echo ${docker_work} | cut -d ' ' -f1)
	sudo docker rmi $(echo ${docker_work} | cut -d ' ' -f2);
fi

# Re-create a new image:

sudo docker build -t node_shark .

# Run docker container:

sudo docker run --name shark_container -p 9090:9090 -d node_shark

# URL for checking:

http://ip-address:9090
