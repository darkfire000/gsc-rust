# rust-docker - a Docker container configuration for Rust
<a href="www.egee.io"><img src="https://i.imgur.com/Mvjrkqo.png" alt="Rust on Docker" width="300" /></a>

[![Build Status](https://travis-ci.org/egee-irl/rust-docker.svg?branch=unstable)](https://travis-ci.org/egee-irl/rust-docker)
[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/42PMX5N)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://github.com/egee-irl/rust-docker/blob/stable/LICENSE)

Host your own dedicated game server and quick and simple as possible with one command:

``docker-compose up``

That's right - a single command will result in your very own dedicated game server! And its fully cross-platform; run it on Linux *or* Windows. That's the power of containers!

The information in this readme is generic and applies to all of the game containers. Check out the <a href="https://github.com/egee-irl/rust-docker/wiki">Wiki</a> for information specific to *this* particular game.

## Getting Started
To get started, you'll need to install the Docker-Engine (v1.10.0+) & Docker-Compose (v1.17.0+). 

### Windows
Docker supports Windows 10 Professional/Enterprise, and Windows Server 2016+. Docker does *not* support Windows 10 Home or Windows 7/8. Docker also <a href="https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install">requires</a> HyperV enabled.

You can download and install Docker & Docker-Compose as one package from the <a href="https://docs.docker.com/compose/install/#install-compose">Docker website</a> or install Docker using <a href="https://chocolatey.org/packages/docker">Chocolatey</a>. Keep in mind that installing Docker from the website or from Chocolatey requires elevated Powershell permissions.

### Linux 
Docker-Compose is available in nearly every distribution repository and typically installs all the required packages as dependencies. Using Debian/Ubuntu as an example, a typical install command would look something like this:

`` sudo apt install -y docker-compose``

Once Docker is installed, you will need to enable and start the Docker daemon:

`` sudo systemctl enable docker.service && sudo systemctl start docker.service``

Finally, it is handy to add your user to the Docker group, unless you enjoy running ``sudo`` for each Docker command:

``sudo groupadd docker && sudo usermod -aG docker $USER``

## Running The Dedicated Server
Once you've installed Docker & Docker-Compose, you are *pretty much* ready to run your server. However, before you dive into the deep side of the pool, there are a few things to consider.

### Considerations
1. Dedicated servers require a *decent* amount of computing power. If your machine doesn't meet the requirements for running a dedicated server, don't even try it; you may lock up and or crash your computer.

2. Docker is largely designed for head-less operation. As such, if you launch a dedicated server and then close the window or lose track of it, you may forget that you have a dedicated server running & eating up resources in the background.

3. Docker images tend to be large. The resulting image for the dedicated server could (probably) be larger than 2gb.

4. Docker containers are generally designed to be ephemeral. Don't store anything such as important player or configuration data in your container.

5. The following platforms are <a href="https://docs.docker.com/engine/installation/#server">officially supported</a>. Windows 10 Professional

### Building & Running The Server
Once you've Docker-Compose installed, you'll want to clone or download this repository. After you've done that, open a terminal window, navigate to repository directory, and run:

``docker-compose up``

Docker should begin reporting the status of the container into your terminal as it is built. It will take about a minute or three to build the container, depending on your CPU & network speed.

Once Docker is finished building the container, it will automatically run and attach itself to it. If you don't want to keep a terminal window open for the server, you can run Docker-Compose with the -d parameter:

``docker-compose up -d``

### Updating The Server
Because Docker containers are somewhat designed to be ephemeral, updating them can be touchy. There is an update script called ``update.sh`` which is used to update the _game data_. You can run the update script against a running container by doing ``docker exec server_name update``.

Updating files _other than_ game data is another story. If you are comfortable with Docker & Linux, you can access the container like this ``docker exec -it server_name bash``. Once inside the container, use ``nano`` to update your files.

### Viewing Logs
Because the server logs reside inside the container itself, the container is configured to output *everything* from the server logs to stdout. You can output the server logs to your terminal by running:

``docker-compose logs``

If you have more than one server running, you will get logs for *all* of the servers. You can specify which server to pull logs from by passing the container name as a parameter:

``docker-compose logs rust-server_1``

If you want to output the logs to a file, you will want to use the regular ``docker logs`` command because ``docker-compose logs`` adds color and formating which does not translate well into actual log files:

``docker logs rust-server_1 > my.log``

## FAQ
Lots of questions, including technical issues, come up and this section aims to address them!

#### ERROR: Version in "./docker-compose.yml" is unsupported.
This error is probably the most common error folks run into (especially on Ubuntu!). It simply means you aren't running the latest version of Docker-Compose. Version 1.17+ is needed for CPU scaling via the Docker-Compose file. You can remedy this error by upgrading to the latest version of Docker-Compose, or commenting out the ``cpus`` attribute in the ``docker-compose.yml`` file.

#### How do I change/update game configuration files?
Short answer: you create a _new_ server. This may seem odd at first but Docker containers are more or less designed to be immutable and changing configuration data on the fly can yield unexpected results.

However if you _really_ want to change or update something on your server, use ``docker exec -it server_name bash`` to access the container and then change whatever you need to from there.

#### How do I backup game data?
Currently there is no "official way" to backup game data. Unofficially, there are a two options:

1. Create <a href="https://docs.docker.com/compose/compose-file/compose-file-v2/#volumes-volume_driver">Docker volumes</a> between the Host and Container using the docker-compose file.
1. Use <a href="https://stackoverflow.com/questions/22049212/copying-files-from-docker-container-to-host">docker cp</a> to copy files/folders back and forth between the Host and Container.

Creating a volume _sounds_ like the easy route but volumes on Docker can be tricky to new-comers, and volume implementation differs based on the host (Linux vs Windows, etc).

The ``docker cp`` command is pretty straight forward and I recommend it if you really need to back up a file or folder.
