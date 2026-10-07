cd ~
mkdir exemplossh
ssh-keygen
cp .ssh/ifmt_ed25519.pub exemplossh/
cd exemplossh
nano Dockerfile
podman build -t ssh:latest .
podman run --rm -d -p 2222:22 ssh
ssh jppreti@localhost -p 2222
podman compose up -d
ansible-galaxy collection install community.general
ansible local -m ping -i hosts.yml
ansible-playbook -i hosts.yml playbook.yml
