# 0001. Choix du reverse proxy : Nginx vs Traefik

## Statut
Accepté

## Contexte
L'équipe héberge une quinzaine de services en conteneurs Docker sur deux serveurs. De nouveaux services sont ajoutés chaque mois, ce qui nécessite aujourd'hui une configuration manuelle du reverse proxy à chaque fois. Le renouvellement des certificats TLS est actuellement fait à la main et a déjà provoqué une coupure de service. L'équipe infra connaît bien Nginx mais n'a pas d'expérience avec Traefik.

## Décision
L'équipe retient **Traefik** comme reverse proxy.

## Options considérées
- **Nginx** : outil maîtrisé par l'équipe, très répandu, mais nécessite une configuration manuelle (vhost + reload) pour chaque nouveau service et ne gère pas nativement le renouvellement des certificats TLS (nécessite certbot + script externe, source de la coupure déjà vécue).
- **Traefik** : découverte automatique des services via les labels Docker (plus besoin de configuration manuelle à chaque ajout mensuel), intégration native avec Let's Encrypt (renouvellement automatique des certificats, supprime le risque de coupure manuelle), mais demande un temps d'apprentissage à l'équipe.

## Conséquences
- Positif : la configuration des nouveaux services sera automatisée via des labels Docker, réduisant la charge opérationnelle mensuelle. Le renouvellement TLS automatique élimine le risque d'incident déjà rencontré.
- Négatif : l'équipe doit monter en compétence sur Traefik ; la migration des ~15 services existants depuis une éventuelle config Nginx devra être planifiée progressivement, service par service, pour limiter le risque.
