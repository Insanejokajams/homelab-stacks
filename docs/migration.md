# Plan de Migración

Este documento describe el proceso de migración de datos y servicios desde OMV hacia ReadyNAS y futuros nodos del clúster.

## 📦 Datos migrados
- Carpeta `Docker` → `/data/K8sStorage/Docker/`
- Multimedia (MoviesUHD, Movies1080, TV, Music) → `/data/K8sStorage/Media/Multimedia/`
- Torrents y Usenet → `/data/K8sStorage/Downloads/`

## 🖥️ Servicios migrados
- Portainer (legacy en OMV) → exportados los stacks en `composes/`
- Plex, Bazarr, Radarr, Sonarr, Overseerr → preparados para despliegue en ReadyNAS/K8s

## 🚀 Pasos realizados
1. Copia de datos con `rsync` desde OMV a ReadyNAS.
2. Verificación de tamaños con `du -sh` y `df -h`.
3. Exportación de stacks desde Portainer y guardado en repo.

## 📌 Pendientes
- Levantar Portainer en ReadyNAS o en clúster K8s.
- Adaptar rutas de volúmenes en los `docker-compose.yml`.
- Retirar OMV de la red tras confirmar migración completa.
