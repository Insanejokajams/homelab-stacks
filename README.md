# Homelab Stacks & Infra

Este repositorio documenta la infraestructura del homelab, incluyendo stacks de Docker exportados, configuración de red, inventario de nodos y planes de evolución hacia Kubernetes.

## ⚙️ Hardware base
- ReadyNAS (almacenamiento principal)
- HP Mini 600 G4 (nodos futuros para Kubernetes)
- NUCs adicionales para escalar el clúster

## 📦 Estado actual
- Contenedores Docker gestionados por Portainer en OMV (legacy).
- Stacks exportados y guardados en `composes/`.
- Datos migrados a ReadyNAS (`/data/K8sStorage`).

## 🚀 Planes de evolución
- Migrar todos los servicios actuales de Docker a Kubernetes.
- Implementar monitoreo con Prometheus + Grafana.
- Desplegar Pi-hole y otros servicios de red como contenedores.
- Gestionar infraestructura con IaC (Terraform + Ansible).
- Documentar todo en este repo para reproducibilidad y escalabilidad.

## 📂 Organización del repo
- `composes/` → Stacks Docker exportados.
- `docs/` → Inventario, red, migración, mantenimiento.
- `diagrams/` → Diagramas de red y arquitectura.
- `README.md` → Visión general y roadmap.

## 📌 Roadmap
1. Migración de datos y stacks desde OMV → ReadyNAS ✅
2. Exportación de configuraciones y documentación ✅
3. Instalación de Kubernetes en HP Mini/NUCs ⏳
4. Despliegue de servicios multimedia en K8s ⏳
5. Implementación de monitoreo y logging centralizado ⏳
6. Infraestructura como Código con Terraform/Ansible ⏳
