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
