if [ -z "${USER}" ]; then export USER=`whoami`; fi

# Config
docker_destination="/sgoinfre/goinfre/Perso/$USER/docker"

# Uninstall docker, docker-compose and docker-machine if they are installed with brew
brew uninstall -f docker docker-compose docker-machine || true

# Check if Docker is installed with MSC and open MSC if not
if [ ! -d "/Applications/Docker.app" ]; then
	echo "Please install Docker for Mac from the MSC (Managed Software Center)"
	open -a "Managed Software Center"
	read -p "Press RETURN when you have successfully installed Docker for Mac..."
fi

# Create needed files in destination and make symlinks
if [ ! -d $docker_destination ]; then
	pkill Docker
	rm -rf ~/Library/Containers/com.docker.docker ~/.docker
	mkdir -p $docker_destination/{com.docker.docker,.docker}
	ln -sf $docker_destination/com.docker.docker ~/Library/Containers/com.docker.docker
	ln -sf $docker_destination/.docker ~/.docker
fi

# Start Docker for Mac
open -a Docker
echo "Docker is now starting\!\nPlease report any bug to: aguiot--"
