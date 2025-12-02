#!/bin/bash
# Script de migración nocturna con rsync + nohup
# Copia Docker y Media en paralelo con logging

# Variables de origen y destino
ORIG_DOCKER="/mnt/meabimediavault/"
DEST_DOCKER="/data/K8sStorage/Docker/"
ORIG_MEDIA="/data/Shared/Media/Multimedia/MoviesUHD/"
DEST_MEDIA="/data/K8sStorage/Media/Multimedia/MoviesUHD/"

# Archivos de log
LOG_DOCKER="/var/log/rsync_docker.log"
LOG_MEDIA="/var/log/rsync_media.log"

# Lanzar copia Docker en background con nohup
nohup rsync -avh --progress "$ORIG_DOCKER" "$DEST_DOCKER" \
  --log-file="$LOG_DOCKER" > /var/log/rsync_docker.out 2>&1 &

# Lanzar copia Media en background con nohup
nohup rsync -avh --progress "$ORIG_MEDIA" "$DEST_MEDIA" \
  --log-file="$LOG_MEDIA" > /var/log/rsync_media.out 2>&1 &

echo "✅ Copias lanzadas en paralelo con nohup."
echo "   - Log Docker: $LOG_DOCKER (stdout: /var/log/rsync_docker.out)"
echo "   - Log Media: $LOG_MEDIA (stdout: /var/log/rsync_media.out)"
echo "Usa 'ps -ef | grep rsync' para verificar que siguen corriendo."
echo "Revisa progreso con 'tail -f /var/log/rsync_docker.log' o 'tail -f /var/log/rsync_media.log'."
