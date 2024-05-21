-- Active: 1716298711122@@127.0.0.1@3306@gestion_projets
CREATE DATABASE IF NOT EXISTS gestion_projets;
USE gestion_projets;

-- Création de la table Catégories
CREATE TABLE IF NOT EXISTS Categories (
    idCategorie INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    couleur VARCHAR(7) NOT NULL,
    isDeleted BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB;

-- Création de la table Utilisateurs
CREATE TABLE IF NOT EXISTS Utilisateurs (
    idUtilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    mdp VARCHAR(255) NOT NULL,
    isDeleted BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB;

-- Création de la table Projets
CREATE TABLE IF NOT EXISTS Projets (
    idProjet INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    deadline DATE,
    idCategorie INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idCategorie) REFERENCES Categories(idCategorie)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Création de la table Taches
CREATE TABLE IF NOT EXISTS Taches (
    idTache INT AUTO_INCREMENT PRIMARY KEY,
    idAuteur INT,
    idProjet INT,
    dateDebut DATE,
    dateFin DATE,
    titre VARCHAR(255) NOT NULL,
    description TEXT,
    priorite INT,
    etat BOOLEAN DEFAULT FALSE,
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idAuteur) REFERENCES Utilisateurs(idUtilisateur)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Création de la table Notifications
CREATE TABLE IF NOT EXISTS Notifications (
    idNotification INT AUTO_INCREMENT PRIMARY KEY,
    idTache INT,
    priorite INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idTache) REFERENCES Taches(idTache)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Création de la table Fichiers
CREATE TABLE IF NOT EXISTS Fichiers (
    idFichier INT AUTO_INCREMENT PRIMARY KEY,
    idProjet INT,
    type VARCHAR(255),
    repertoire VARCHAR(255),
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Création de la table Projets_Utilisateurs (table de liaison n-n)
CREATE TABLE IF NOT EXISTS Projets_Utilisateurs (
    idUtilisateur INT,
    idProjet INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (idUtilisateur, idProjet),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Création de la table Taches_Utilisateurs (table de liaison n-n)
CREATE TABLE IF NOT EXISTS Taches_Utilisateurs (
    idUtilisateur INT,
    idTache INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (idUtilisateur, idTache),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idTache) REFERENCES Taches(idTache)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
