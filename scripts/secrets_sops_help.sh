#!/usr/bin/env bash
set -euo pipefail

KEY=~/.config/sops/age/keys.txt

# Generar clave age si no existe
[ -f "$KEY" ] || age-keygen -o "$KEY"

# Cifrar .env
sops --encrypt --age "$(grep public "$KEY" -A1 | tail -n1 | awk '{print $NF}')" .env > .env.enc

# Descifrar .env.enc
# sops --decrypt .env.enc > .env
