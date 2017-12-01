# rust-docker - a Docker container configuration for Rust
<a href="www.egee.io"><img src="https://i.imgur.com/Mvjrkqo.png" alt="Rust on Docker" width="300" /></a>

[![Build Status](https://travis-ci.org/egee-irl/rust-docker.svg?branch=unstable)](https://travis-ci.org/egee-irl/rust-docker)
[![Discord](https://discordapp.com/api/guilds/183740337976508416/widget.png?style=shield)](www.egee.io)

Host your own dedicated game server and quickly and simply as possible by running one command:

``docker-compose up``

That's right - this single command will result in your very own dedicated game server. And its fully cross-platform; run it on Linux *or* Windows. That's the power of containers!

## Getting Started
To get started, you'll need to install Docker & Docker-Compose. 

### Windows
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

2. Docker is largely designed for head-less automation. As such, if you launch a dedicated server and then close the window or lose track of it, you may forget that you have a dedicated server running in the background.

3. Docker images tend to be large. The resulting image for the dedicated server could (probably) be larger than 1gb.

4. Docker containers are generally designed to be ephemeral. Don't store anything such as important player or configuration data in your container.

5. If you are running Linux, make sure you have a new-ish kernel. Docker tends to take advantage and in some cases depend on features only available in more recent kernels.

### Building & Running The Server
Once you've got the dependencies installed, you'll want to clone or download this repository. After you've done that, open a terminal window, navigate to repository directory, and run:

``docker-compose up``

Docker should begin reporting the status of the container into your terminal as it is built. It typically takes around 10 minutes to build the container, depending on your CPU & network speed.

Once Docker is finished building the container, it will automatically run and attach itself to it. If you don't want to keep a terminal window open for the server, you can run Docker with the -d parameter:

``docker-compose up -d``

### Viewing Logs
Because the server logs reside inside the container itself, the container is configured to output *everything* from the server logs to stdout. You can output the server logs to your terminal by running:

``docker-compose logs``

If you have more than one server running, you will get logs for *all* of the servers. You can specify which server to pull logs from by passing the container name as a parameter:

``docker-compose logs rust-server_1``

If you want to output the logs to a file, you will want to use the regular ``docker logs`` command because ``docker-compose logs`` adds color and formating which does not translate well into actual log files:

``docker logs rust-server_1 > my.log``
