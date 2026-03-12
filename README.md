# Formation Pratique Docker & Docker Compose

Bienvenue dans le parcours de formation pratique **Docker & Docker Compose** ! Ce dépôt centralisé (site web statique) a été conçu pour vous amener d'un niveau grand débutant à un niveau expert en conteneurisation.

## Structure du Cours

Ce parcours est divisé en TP (Travaux Pratiques) progressifs. Chaque labo se concentre sur des concepts spécifiques, en s'appuyant sur les connaissances acquises lors des précédents.

| Labo | Difficulté | Thème | Description |
|---|---|---|---|
| **TP-01** | Débutant | *Bases Docker* | CLI Docker, téléchargement d'images, lancement de conteneurs. |
| **TP-02** | Débutant | *Construire ses Images* | Écriture du premier Dockerfile, compilation d'images et cache. |
| **TP-03** | Débutant | *Volumes et Réseaux* | Persistance des données et communication inter-conteneurs. |
| **TP-04** | Intermédiaire | *Architecture Simple* | Exécution manuelle d'applications multi-conteneurs (Web + DB). |
| **TP-05** | Intermédiaire | *Bonnes Pratiques* | Linting de Dockerfiles avec Hadolint et optimisation avancée. |
| **TP-06** | Intermédiaire | *Intégration CI* | Automatisation du contrôle qualité des Dockerfiles (Pipeline Bash). |
| **TP-07** | Avancé | *Sécurité et Audit* | Scan de vulnérabilités (CVEs) avec Trivy et remédiation. |
| **TP-08** | Débutant | *Débuter avec Compose* | Simplification de l'orchestration locale avec `docker-compose.yml`. |
| **TP-09** | Intermédiaire | *Compose Intermédiaire* | Réseaux isolés, volumes nommés, et reverse proxy simple. |
| **TP-10** | Avancé | *Compose Avancé* | Healthchecks conditionnels, et limitations de ressources CPU/RAM. |
| **TP-11** | Avancé | *Observabilité & Logs* | Pilotage des logs, rotation de fichiers JSON et sondes HTTP. |
| **TP-12** | Expert | *Stack de Production* | Le chef-d'œuvre : Multi-stage builds, Nginx Ingress, sécurité maximale CI ! |

## Prérequis et Environnement Local

Pour suivre cette formation, assurez-vous de disposer des outils suivants (idéalement sous Linux Ubuntu ou Windows via WSL2) :

1. **Docker Engine** : [Installer Docker](https://docs.docker.com/engine/install/)
2. **Docker Compose** : Installé en tant que plugin CLI moderne.
3. **Hadolint** : Utilisable en local ou à la volée via Docker.
4. **Trivy** : Scanner Aqua-Security (utilisable via Docker).

## Comment utiliser cette formation ?

Toute la partie cours et explication se trouve concentrée dans le portail web statique accessible dans le dossier `docker-tps-site/`.
Ouvrez simplement le fichier `docker-tps-site/index.html` dans votre navigateur Web préféré !

**Important** : Le code source (les TPs techniques) n'est plus éparpillé : en tant qu'apprenant, reprenez les consignes pas à pas depuis le site, et créez vos propres dossiers et fichiers techniques de A à Z par vous-même en suivant la formation. C'est la méthode "Do It Yourself" (DIY) qui prime ici !

## Nettoyage des environnements

Afin de ne pas surcharger votre machine entre deux travaux pratiques, pensez à nettoyer vos Docker :
```bash
# Arrêter tous les conteneurs
docker stop $(docker ps -aq) 2>/dev/null || true

# Supprimer tous les conteneurs arrêtés
docker rm $(docker ps -aq) 2>/dev/null || true

# Nettoyer un écosystème Compose (depuis le dossier contenant le docker-compose.yml)
docker compose down -v
```

---

## Auteur et Licence

**KHLIFI HOUCEM / FORMATEUR DEVSECOPS && CLOUD**

*Ce contenu pédagogique et ses éventuels codes sources attenants sont diffusés dans le cadre d'un apprentissage technique. Le matériel et l'architecture "DevOps" associée sont soumis aux règles de la formation ouverte.* 

© 2024-2026 - Tous droits réservés, KHLIFI HOUCEM.
