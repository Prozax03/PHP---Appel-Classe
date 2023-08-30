# Appel Classe

Table of contents:
* [Introduction](#introduction)
* [Installation](#installation)
* [Utilisation](#utilisation)

## Introduction

VERSION 1 utilisateur
Appel Classe est une application web permettant de faire l'appel dans une école.

VERSION Etablissement (Plusieurs utilisateurs) -- EN COURS DE DEV

## Installation

Si vous utilisez xampp comme serveur web, très peu de choses à faire, sinon il faudra modifier l'ensemble des scripts pour cibler l'exécutable de mysql.
Les chemins des scripts à modifier : 

    - Import/import.bat
    - Import/dump.bat

Connexion par defaut : 
    - DB Name : appelclasse
    - User : root
    - Pass : 

ATTENTION, si vous changez les identifiants, il faut également les modifer dans les fichiers suivants : 

    - model/db.php

Pour les scripts il faudra rajouter l'option "-p MOTDEPASSE" (seulement si vous avez mis un mot de passe)
ex: C:\xampp\mysql\bin\mysqldump.exe -u prozax -p MonSuperMotDePasse -h localhost appelclasse > dump/appelclasse.sql
    
    - Import/import.bat
    - Import/dump.bat


Dans le projet, la base de données s'importe automatiquement dès que le fichier install.txt est présent dans la racine.
Si besoin, la BDD se trouve dans "Import/appelclasse.sql" (tant que vous n'utilisez pas la fonction d'import).

## Utilisation

Démarrez votre serveur web et accédez au repertoire du projet pour accéder à la page par défaut (index.php).
ex : http://localhost/appelClasse/ -> redirigera automatiquement sur index.php 

Pour importer et exporter la base de données la page est savimp.php
ex : http://localhost/appelClasse/index.php?action=savimp
