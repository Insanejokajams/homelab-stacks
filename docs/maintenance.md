# Estrategia de Mantenimiento

Este documento define las prácticas de respaldo, actualización y monitoreo del homelab.

## 🔄 Backups
- Snapshots en ReadyNAS para carpetas críticas (`Media`, `Docker`).
- Rsync programado hacia disco externo cada semana.
- Exportación periódica de `docker-compose.yml` y configuración a GitHub.

## 🛠️ Actualizaciones
- Contenedores gestionados con Portainer (legacy hasta que se gestione todo con kubernetes).
- Uso de Watchtower para actualizar imágenes automáticamente.
- Documentar versiones estables en el repo.

## 📊 Monitoreo
- Pi-hole en ReadyNAS para DNS y métricas de red.
- Grafana + Prometheus (plan futuro en K8s).
- Logs centralizados en `/data/K8sStorage/logs`.

## ⚖️ Buenas prácticas
- Confirmar espacio libre con `df -h` antes de migraciones.
- Documentar cada cambio en Git (commits descriptivos).
- Mantener `.env` fuera del repo (solo `.env.example`).
