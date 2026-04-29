cd ~
mkdir exemplossh
ssh-keygen
cp .ssh/id_ed25519.pub exemplossh/
cd exemplossh
nano Dockerfile
podman build -t exemplossh:latest .
podman run --rm -d -p 2222:22 exemplossh
ssh devuser@localhost -p 2222
