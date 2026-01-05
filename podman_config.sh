sudo -- sh -c 'echo "net.ipv4.ip_unprivileged_port_start=440" > /etc/sysctl.conf'


podman pod create -p 443:443 n8n

podman create --pod n8n --name n8n -v n8n:/home/node/.n8n:Z -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true -e N8N_RUNNERS_ENABLED=true docker.n8n.io/n8nio/n8n:latest

podman create --pod n8n --name caddy caddy:latest caddy reverse-proxy --from rhel1.sk12.local:443 --to :5678

podman pod start n8n
