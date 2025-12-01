# Gestión de secretos en el homelab

Este proyecto **no almacena secretos en texto plano**. Todos los valores sensibles (contraseñas, tokens, certificados) se gestionan mediante **HashiCorp Vault** y/o archivos cifrados con SOPS.

## 🔑 Estrategia

- **Vault**: almacén central de secretos, accesible solo por el clúster Kubernetes.
- **Sealed Secrets**: versión cifrada de los Secrets de Kubernetes, segura para incluir en el repo.
- **SOPS**: cifrado de archivos `.env` o configuraciones locales, usando claves `age`.

## 📌 Flujo de trabajo

1. Los secretos se crean en Vault (`vault kv put secret/app DB_PASSWORD=...`).
2. Kubernetes accede a ellos mediante **External Secrets Operator**.
3. En el repo solo se versionan:
   - Manifests de `ExternalSecret` (sin valores en texto plano).
   - Archivos `.env.enc` cifrados con SOPS.
4. `.env` y otros archivos sensibles están en `.gitignore`.

## 🛠️ Herramientas

- **HashiCorp Vault**: almacén central, con políticas y rotación.
- **External Secrets Operator**: sincroniza secretos de Vault hacia Kubernetes.
- **SOPS**: cifrado de archivos locales para pruebas o Docker Compose.
- **Sealed Secrets**: alternativa para versionar secretos cifrados en K8s.

## 🚀 Ejemplo de uso

### Crear secreto en Vault
```bash
vault kv put secret/qbittorrent USER=admin PASS=supersecret

#ExternalSecret manifest
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: qbittorrent-secrets
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: vault-backend
    kind: ClusterSecretStore
  target:
    name: qbittorrent-secret
  data:
    - secretKey: USER
      remoteRef:
        key: secret/qbittorrent
        property: USER
    - secretKey: PASS
      remoteRef:
        key: secret/qbittorrent
        property: PASS

#Usar en Deployment
envFrom:
  - secretRef:
      name: qbittorrent-secret

# Gestión de secretos con Vault y External Secrets

- Los secretos viven en **Vault** (KV v2).
- Kubernetes los consume con **External Secrets Operator** (ESO).
- En el repo solo hay manifests de `ExternalSecret` y `SecretStore`.
- Para entornos locales/Docker: usar `.env.enc` con **SOPS** (opcional).

## Flujo
1. Crear/actualizar secretos en Vault (`vault kv put secret/app KEY=VALUE`).
2. `ExternalSecret` mapea claves de Vault a un Secret de K8s.
3. El Deployment consume el Secret como `env` o archivos montados.
4. Rotación: cambias el valor en Vault; ESO sincroniza automáticamente.

## Rutas recomendadas en Vault
- `secret/qbittorrent`
- `secret/sabnzbd`
- `secret/plex`
- `secret/postgres/<db>`

#Paso a paso operativo resumido

Levanta Vault y habilita KV v2 en secret/.

Crea secretos en rutas por servicio: vault kv put secret/qbittorrent ....

Instala ESO en el cluster.

Crea ClusterSecretStore apuntando a Vault con el método de auth elegido.

Aplica ExternalSecret por servicio; verifica que se cree el Secret de K8s.

Consume el Secret en tus Deployments.

Rota y audita desde Vault; no toques Git para cambiar valores.