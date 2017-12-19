# gsc-rust - a Game Server Container for Rust
<a href="www.egee.io"><img src="https://i.imgur.com/Mvjrkqo.png" alt="Rust on Docker" width="300" /></a>

[![Build Status](https://travis-ci.org/egee-irl/gsc-rust.svg?branch=unstable)](https://travis-ci.org/egee-irl/gsc-rust)
[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/42PMX5N)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://github.com/egee-irl/gsc-rust/blob/stable/LICENSE)

Host your very own dedicated Rust server with one command:

``docker-compose up``

That's it! And its fully cross-platform; run it on Linux *or* Windows. That's the power of Game Server Containers!

**Note** - this readme assumes you've already installed the prerequisites to run a Game Server Container. If you want to learn more and see what it takes to run your own Game Server Container, check out the <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo.

### Starting The Server

Rust is one of the easiest games to serve in a container because *all* of the launch parameters are passed to the server at runtime. Additional configuration keys are passed via the ``server.cfg`` file in the ``cfg`` directory.

Hosting your own dedicated server is ridiculously easy:

1. Clone this repo
2. Run ``docker-compose up`` from a terminal in the repo directory

Docker should start downloading the base ``rustserver`` image and then begin building the container. Once the container is built, it will automatically run. If you don't want the server attached to your terminal window, you can safely kill the process (ctrl-c), and restart it detached from your terminal: ``docker-compose up -d``. If the server is detached from your terminal, you can <a href="https://github.com/egee-irl/gsc-docs#viewing-logs">view the logs</a> the same as any Game Server Container.

### Configuring The Server

There are 3 config files you may want to change before making your game server public. The config files are:

<a href="https://github.com/egee-irl/gsc-rust/wiki/server.cfg">server.cfg</a> - This is the main config file for the whole server. Almost much everything you'll want to do to set the server up will be found here.

<a href="https://github.com/egee-irl/gsc-rust/wiki/users.cfg">users.cfg</a> - If you have folks you want to be persistent admins of your server, set them in this file so that they are active admins when the server starts up.

<a href="https://github.com/egee-irl/gsc-rust/wiki/bans.cfg">ban.cfg</a> - If there's some asshat you never want joining your server, set them in this file so the ban is active as soon as the server starts.

<a href="https://github.com/egee-irl/gsc-rust/wiki/server.log">server.log</a> - Not a config file but an equally important file that stores all the server activity.

### Updating The Server

Rust follows a pretty regular update & wipe schedule. A minor update occurs every Thursday, and a major update & map wipe happens every _first_ Thursday of the month. All updates require rebooting of the server, and the wipe update will restart all map data and sometimes player data (blueprints, etc).

Updating the server is super easy:

``docker-compose exec rust-server update``

Always make sure you are in the repo directory when issuing Docker-Compose commands.
