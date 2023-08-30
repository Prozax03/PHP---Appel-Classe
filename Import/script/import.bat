@echo off
REM Backup BDD
REM C:\xampp\mysql\bin\mysqldump.exe -u root -h localhost appelclasse > dump/backup.sql

REM Suppression de la BDD
C:\xampp\mysql\bin\mysql.exe -u root -NBe "DROP DATABASE IF EXISTS appelclasse"

REM Creation de la BDD
C:\xampp\mysql\bin\mysql.exe -u root -NBe "CREATE DATABASE appelclasse"

REM Import de la BDD
C:\xampp\mysql\bin\mysql.exe -u root appelclasse < ../appelclasse.sql