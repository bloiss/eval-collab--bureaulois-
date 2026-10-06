# eval-collab--bureaulois-

## Objectif du projet
Dépôt support à un exercice d'exploitation d'infrastructure : gestion d'une quinzaine de services conteneurisés Docker répartis sur deux serveurs, accès distant via VPN WireGuard, et choix/documentation du reverse proxy.

> Remarque : au moment de la rédaction, ce dépôt ne contient pas encore de configuration d'infrastructure réelle sur `main` (uniquement la documentation et les gabarits d'issues). Les informations ci-dessous sont basées sur les décisions documentées dans `docs/adr/` ; toute information non vérifiable dans le dépôt est signalée comme une hypothèse.

## Architecture (hypothèse, basée sur l'ADR 0001)
- Reverse proxy : Traefik, en frontal des services Docker.
- VPN : WireGuard sur le serveur `vpn-01` (port UDP 51820), pour l'accès des télétravailleurs au réseau interne.
- Hébergement : deux serveurs physiques/virtuels, environ 15 services conteneurisés.

## Documentation
- Décisions d'architecture : `docs/adr/`
- Conventions et règles pour toute contribution (automatisée ou non) : `AGENTS.md`

## Contribution
- Toute modification passe par une Pull Request vers `main` (branche protégée).
- Commits au format Conventional Commits.
- Voir `AGENTS.md` pour les commandes de vérification et les interdits.
