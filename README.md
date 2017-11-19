# rust-docker
A Rust server running inside of a Docker container

You can run your own Rust server in a Docker container like this:

* Clone or download/extract this repo
* docker build . -t rustserver
* docker run -d -p 28015:28015/udp -p 28016:28016/tcp rustserver

You can access the server logs by doing ``docker logs rustserver`` or by attaching to the container directly.

Since Rust wipes monthly, it makes sense to simply remove & re-create the container each month, rather than using ``exec`` to update the server.
