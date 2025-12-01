# Red Docker Macvlan0

Este documento describe la configuración de la red `macvlan0` utilizada en el homelab para asignar IPs fijas a los contenedores dentro de la subred principal.

## ⚙️ Configuración actual
- Nombre: `macvlan0`
- Driver: `macvlan`
- Scope: local
- Subnet: `10.24.24.0/24`
- Gateway: `10.24.24.1`
- Parent interface: `enp5s0` (interfaz física del host)
- IPs asignadas: ver `docs/network.md` (ej. Plex 10.24.24.84, Sonarr 10.24.24.87, etc.)

## 📌 Comando de creación
```bash
docker network create -d macvlan \
  --subnet=10.24.24.0/24 \
  --gateway=10.24.24.1 \
  -o parent=enp5s0 macvlan0
