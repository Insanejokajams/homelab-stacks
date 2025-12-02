# 📂 Scripts de Migración y Gestión de Secrets

Este repositorio documenta los scripts utilizados en el proceso de migración de datos desde ReadyNAS hacia el nuevo almacenamiento, así como utilidades para la gestión de secretos con SOPS.

---

## 🚀 Migración de Datos

### `migrar_datos_batch1.sh`
- Copia inicial de carpetas grandes (ej. Docker y MoviesUHD).
- Usa `rsync` con `nohup` para correr en segundo plano.
- Genera logs separados para cada carpeta.

### `migrar_datos_batch2.sh`
- Script maestro secuencial para mover todas las carpetas restantes.
- Orden optimizado: primero las menores (`Libros`, `videos`, `Videos Musicales`, `Music`), luego las grandes (`Anime`, `Movies1080`).
- Copia con `rsync` y borra automáticamente la carpeta origen al terminar.
- Logs por carpeta en `/var/log/rsync_batches`.

---

## 🔐 Gestión de Secrets

### `secrets_sops_help.sh`
- Script de ayuda para trabajar con **SOPS**, **age**, y **git-crypt**.
- Facilita la encriptación y desencriptación de archivos `.env` y manifests.
- Pensado para integrarse en flujos de CI/CD y repos públicos.
- Documenta comandos básicos y ejemplos de uso.

---

## 📑 Uso

Ejecutar los scripts con `nohup` para que corran en segundo plano:

```bash
nohup ./migracion_maestra.sh > /var/log/migracion_total.out 2>&1 &
#Monitorear progreso:
tail -f /var/log/migracion_total.out
tail -f /var/log/rsync_batches/rsync_Movies1080.log

## Notas
Los borrados en ReadyNAS pueden tardar bastante (ej. 2 TB ≈ 30 minutos).

Los scripts están diseñados para ser reproducibles y fáciles de adaptar a futuros entornos.

El objetivo es documentar tanto la migración como las prácticas seguras de manejo de secretos.
