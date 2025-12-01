# Mapeo de Configuración de Carpetas en /K8sStorage

Este documento describe la estructura de almacenamiento utilizada en el homelab, organizada por propósito: Media, Docker y Kubernetes.

---

## 📀 Media
Tu librería multimedia y directorios de entrada/salida para descargas.

/K8sStorage/Media/ 
├── Torrents/ # Descargas vía BitTorrent 
│ ├── blackhole/ # Entrada de archivos .torrent 
│ ├── completed/ # Descargas finalizadas 
│ └── incomplete/ # Descargas en progreso 
├── Multimedia/ # Librería multimedia organizada 
│ ├── Anime/ 
│ ├── Libros/ 
│ ├── Movies1080/ 
│ ├── MoviesUHD/ 
│ ├── Music/ 
│ ├── TV/ 
│ ├── Videos/ 
│ └── Videos Musicales/ 
└── Usenet/ # Descargas vía Usenet 
├── blackhole/ # Entrada de archivos .nzb 
├── completed/ # Descargas finalizadas 
└── incomplete/ # Descargas en progreso

---

## 🐳 Docker
Configuración y datos persistentes de contenedores Docker.

/K8sStorage/Docker/ 
├── sonarr/ # Configuración y base de datos de Sonarr 
├── radarr/ # Configuración y base de datos de Radarr 
├── plex/ # Configuración y metadatos de Plex 
├── qbittorrent/ # Configuración y estado de qBittorrent └── ... # Otros servicios (Bazarr, Overseerr, etc.)

---

## ☸️ Kubernetes
Volúmenes y datos creados por el clúster K8s.

/K8sStorage/K8s/ 
├── pvc/ # PersistentVolumeClaims (subcarpetas generadas automáticamente por K8s) 
├── logs/ # Logs centralizados de servicios 
└── configs/ # Configuraciones externas montadas en pods

---

## 📌 Notas
- Las carpetas `blackhole` son puntos de entrada desde Windows u otros clientes para enviar archivos `.torrent` y `.nzb`.
- Las carpetas `completed` e `incomplete` son gestionadas por los clientes de descarga (qBittorrent, SABnzbd).
- Las subcarpetas dentro de `pvc/` serán creadas automáticamente por Kubernetes al generar PersistentVolumeClaims.
- `logs/` y `configs/` deben ser creadas manualmente y organizadas por servicio.


