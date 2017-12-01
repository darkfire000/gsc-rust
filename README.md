# rust-docker
[![Maintainability](https://api.codeclimate.com/v1/badges/e8d2f93056ca8bdf8444/maintainability)](https://codeclimate.com/github/egee-irl/rust-docker/maintainability)
[![Build Status](https://travis-ci.org/egee-irl/rust-docker.svg?branch=unstable)](https://travis-ci.org/egee-irl/rust-docker)
[![Discord](https://discordapp.com/api/guilds/183740337976508416/widget.png?style=shield)](www.egee.io)

A Rust server running inside of a Docker container.

You can run your own Rust server in a Docker container like this:

* Clone or download/extract this repo
* Run ``docker build . -t rustserver``
* Run ``docker run -d -p 28015:28015/udp -p 28016:28016/tcp rustserver``

If you want to change your RCON password, replace ``__PASSWORD__`` in the Dockerfile with your favorite password. And don't forget to change ``server.description`` in the server.cfg, otherwise your server will have the same description as mine!

You can access the server logs by running ``docker logs rustserver`` or by attaching to the container directly.

Since Rust wipes monthly, it makes sense to simply remove & re-create the container each month, rather than using ``exec`` to update the server.
