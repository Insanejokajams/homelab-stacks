# Portainer Stacks Exportados

Este repositorio contiene los archivos `docker-compose.yml` exportados desde Portainer en OMV, para poder recrear los servicios en ReadyNAS o en un clúster Kubernetes en el futuro.

## 📂 Servicios incluidos
- Plex
- Bazarr
- Radarr
- Sonarr
- qBittorrent
- SABnzbd
- Overseerr
- Portainer
- Mantainer
- Pihole
- Prowlarr
- Readarr
- Recyclarr
- Watchtower

## ⚙️ Notas de configuración
- Los volúmenes apuntaban originalmente a rutas en OMV:
  - `/srv/dev-disk-by-uuid-79a618dc-2955-4d54-b68e-650186fa473c/Docker`
- Ahora deben mapearse a rutas en ReadyNAS:
  - `/data/K8sStorage/Docker/...`

- Los archivos multimedia se encontraban en:
  - `/srv/remotemount/MeabiMedia/Multimedia`
- Ahora deben mapearse a:
  - `/data/K8sStorage/Multimedia/...`

de manera temporal mientras llegan los nuevos nodos, lo configurare como remotemount posteriormente ya van a apuntar directamente a ReadyNAS con la ruta indicada previamente

## 🚀 Cómo levantar un servicio
Ejemplo para Plex:
```bash
docker-compose -f plex.yml up -d
