#!/bin/bash
# Script maestro de migración secuencial con rsync + borrado directo
# Orden optimizado: primero carpetas menores, luego las grandes

CARPETAS=("Libros" "videos" "Videos Musicales" "Music" "Anime" "Movies1080")

ORIG_BASE="/data/Shared/Media/Multimedia/"
DEST_BASE="/data/K8sStorage/Media/Multimedia/"
LOG_DIR="/var/log/rsync_batches"
mkdir -p "$LOG_DIR"

for carpeta in "${CARPETAS[@]}"; do
    echo "🚀 Iniciando migración de: $carpeta"

    ORIG="$ORIG_BASE$carpeta/"
    DEST="$DEST_BASE$carpeta/"
    LOG="$LOG_DIR/rsync_${carpeta}.log"

    # Copia con rsync
    rsync -avh --progress "$ORIG" "$DEST" --log-file="$LOG" > "$LOG_DIR/${carpeta}.out" 2>&1

    # Borrado directo sin verificación
    echo "🗑️ Borrando carpeta origen: $ORIG"
    rm -rf "$ORIG"

    echo "---------------------------------------------"
done

echo "🎉 Migración completa. Revisa logs en $LOG_DIR"
