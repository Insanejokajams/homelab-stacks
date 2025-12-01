# Configuración de Red

## Subred principal
- Rango: 10.24.24.0/24
- Gateway: 10.24.24.1
- DNS: 10.24.24.1 (router), 10.24.23.81 (Pi-hole)
## Subnet wifi
- Rango: 10.24.23.0/24
- Gateway: 10.24.23.1
- DNS: 10.24.24.1 (router), 10.24.24.81 (Pi-hole)

## Asignación de IPs
- 10.24.24.2 → ReadyNAS (Storage)
- 10.24.24.3 → OMV (legacy, pronto retirado, contenedores Docker)
- 10.24.24.21 → Nodo 1 (K8s Master)
- 10.24.24.22 → Nodo 2 (K8s Worker)
- 10.24.24.23 → Nodo 3 (K8s Worker futuro)

## IPs reservadas actuales
- bazzarr: 10.24.24.95
- bazzarr2: 10.24.24.96
- flaresolver: 10.24.24.83
- lidarr: 10.24.24.89
- mantainer: 10.24.24.80
- overserr: 10.24.24.90
- pihole: 10.24.24.81
- plex: 10.24.24.84
- prowlarr: 10.24.24.92
- qbittorrent: 10.24.24.93
- radarr: 10.24.24.85
- radarruhd: 10.24.24.86
- readarr: 10.24.24.97
- recyclarr: 10.24.24.91
- sabnzbd: 10.24.24.94
- sonarrtv: 10.24.24.87
- watchtower: 10.24.24.82

'se intentara en un futuro acceder a los distintos contenedores desde un destino comun ya sea una pagina estatica con las ligas y puertos o algun tipo de portforwarding'

