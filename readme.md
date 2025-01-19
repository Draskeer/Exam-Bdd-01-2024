# Projet base de données B3

Pour cette second version de ce projet, nous allons reprendre la V1 et ajouter des améliorations. 

- Ajout de verifications sur les données d'entrée
- Ajout de la documentation sur les données des endpoints
- Ajout des endpoints demandés après la V1
- Ajout de procédures stockées pour les requêtes
- Correction de la documentation des endpoints
- Correction des faiblesses de la première version
- Correction des fails SQL Injection

Pour plus d'information concernant l'api, veuillez trouver une documentation ici:

[https://github.com/Draskeer/Exam-Bdd-01-2024/blob/V2/api_endpoint_v2.md](Documentation API)




# Getting started:

## Pour lancer le projet sql :

1. Créer une base de données nommée dans votre serveur MySQL via le script disponible dans le fichier `shema_V1.sql`.
2. Exécuter le script `row_samples_V1.sql` pour insérer des données dans la base de données.

## Pour lancer l'api :

1. Se rendre dans le dossier `app`.
2. Installer les dépendances avec `npm install`.
3. Remplir le fichier `.env` avec les informations de connexion à la base de données et le port.
4. Lancer l'api avec `npm start`.
5. Vous pouvez maintenant utiliser les endpoints de l'api.

Vous pouvez trouvr la liste des endpoints dans `api_endpoint_V1.md`.
