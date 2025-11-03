# Projet Base de Données - Qualité de l'Air

## Description

Ce projet a été réalisé dans le cadre de la première année du cycle préparatoire intégré en école d'ingénieur. Il consiste en la conception et la mise en place d'une base de données pour stocker et interroger les données publiques sur la qualité de l'air dans les grandes villes de France. Cette initiative a été menée par une équipe fictive, **Clear Data**, mandatée par le ministère de la Transition écologique.

L’objectif principal était de centraliser et gérer des données environnementales tout en respectant les normes techniques et réglementaires comme le RGPD.

## Contenu du Répertoire

- **Modélisation :**
  - Modèle Conceptuel des Données (MCD)
  - Modèle Logique des Données (MLD)
  - Modèle Physique des Données (MPD)
- **Fichiers SQL :**
  - Script pour la création des tables
  - Ajout des contraintes (clé primaire, clé étrangère)
  - Création de triggers
  - Création des utilisateurs et définition de leurs permissions
- **Peuplement :**
  - Scripts pour importer des données tests générées dans les tables
  - Méthodologie pour le peuplement par importation de fichiers CSV

### MCD
<img width="945" height="586" alt="image" src="https://github.com/user-attachments/assets/2f909f11-32e0-4985-83f3-93b0d03766b2" />

### MLD
<img width="994" height="603" alt="image" src="https://github.com/user-attachments/assets/42c5cce8-ac5b-4ea7-8c34-f017a197fd30" />


## Fonctionnalités Techniques

1. **Normalisation :**
   - La base de données respecte la 3ème forme normale (3NF) pour éviter les redondances et garantir l'intégrité des données.

2. **Utilisation de triggers :**
   - Bloquer la modification et suppression dans certains cas spécifiques (ex. rapports).
   - Par exemple, tout `UPDATE` ou `DELETE` sur la table `rapport` est intercepté pour signaler une erreur et afficher un message.

3. **Gestion des utilisateurs :**
   - Utilisation d'un rôle administrateur avec toutes les permissions (`CREATE`, `DELETE`, etc.).
   - Rôle utilisateur limité à des permissions spécifiques (`INSERT`, `SELECT`, `UPDATE`, etc.).

4. **Performance et sécurité :**
   - Adoption du moteur InnoDB (MySQL) pour l'intégrité référentielle.
   - Suivi des transactions avec journaux en cas de panne.

5. **Peuplement de données :**
   - Génération automatique de données cohérentes (ex. capteurs, mesures, personnel) traitées sous CSV.
   - Import séquentiel dans les différentes tables pour éviter les erreurs.

## Technologie

Le projet utilise **MySQL** pour la base de données, et les outils d'importation de données comme **DataGrip**.

## Licence

Ce projet est sous licence **CC BY-NC-SA 4.0**.

[![CC BY-NC-SA 4.0](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)
