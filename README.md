# Docker Swarm Mode

Ce document est un aide mémoire détaillant les étapes nécessaires à la configuration d'un cluster Docker avec Swarm mode.

## Références documentaires

[Guide de l'administrateur](https://docs.docker.com/engine/swarm/admin_guide/)

## Création d'un cluster avec Swarm Mode

Un cluster Swarm est constitué d'un ensemble de démons Docker. Chaque démon peut être configuré en __manager__ ou __worker__.

> Pour être résistant à la panne, un cluster doit être constitué d'au moins 3 managers.

### Création du cluster

Depuis le terminal d'une machine destinée à être un __manager__, effectuer la création du cluster avec la commande suivante :

```bash
docker swarm init --advertise-addr <first_manager_ip_address>
```

Il est important de spécifier l'adresse IP du __manager__ initial. Cela nécessite obligatoirement d'utiliser des adresse IP fixes pour les machines __manager__. À la création du cluster, la commande ci-dessus retourne la commande à executer sur les machines que l'on souhaite joindre au cluster.

# Remarques et astuces

## Attention au conteneurs inactifs

Lors de la création d'un service, si des d'autres conteneurs utilisent les mêmes ports réseau, Docker sera dans l'incapacité de créer les conteneurs composants le service. Il faut alors s'assurer que les ports réseau ne sont pas utilisés par d'autres service ou que des conteneurs non utilisés n'occupent pas les ports en question.

## Les commandes pour nettoyer

- Supprimer toutes les données non utilisées : `docker system prune`
- Supprimer les conteneurs non utilisés : `docker container prune`
- Supprimer les images non utilisés : `docker image prune`
- Supprimer les volumes non utilisés : `docker volume prune`
- Supprimer les réseaux non utilisés : `docker network prune`