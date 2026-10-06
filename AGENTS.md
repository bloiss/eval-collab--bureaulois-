# AGENTS.md

## Contexte du projet
Dépôt d'exploitation pour une infrastructure d'environ 15 services hébergés en conteneurs Docker sur deux serveurs. Le reverse proxy en place est Traefik (voir docs/adr/0001-choix-reverse-proxy.md). Un VPN WireGuard (serveur vpn-01) permet l'accès des télétravailleurs au réseau interne.

## Commandes de vérification
- `docker compose config` : valider la syntaxe d'un fichier docker-compose avant de le committer.
- `nginx -t` (ou `traefik healthcheck` selon le service) : valider une configuration de reverse proxy avant tout reload.
- `shellcheck scripts/*.sh` : vérifier les scripts shell avant de les committer.

## Conventions
- Commits au format Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`...).
- Toute modification passe par une Pull Request vers `main` (aucun push direct n'est autorisé).
- Les décisions d'architecture significatives sont documentées sous forme d'ADR dans `docs/adr/`, à partir du modèle `docs/adr/0000-modele.md`.

## Interdits
- Ne jamais committer de secret, mot de passe ou clé en clair (utiliser des variables d'environnement non versionnées).
- Ne jamais utiliser le tag `latest` pour une image en production ; toujours figer une version.
- Ne jamais recharger un service (nginx, traefik) sans avoir validé la configuration au préalable.
