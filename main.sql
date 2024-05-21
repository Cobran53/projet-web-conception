CREATE DATABASE gestion_projets;

/* USE gestion_projets; */

-- Création de la table Catégories
CREATE TABLE Categories (
    idCategorie INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    couleur VARCHAR(7) NOT NULL,
    isDeleted BOOLEAN DEFAULT FALSE
);

-- Création de la table Utilisateurs
CREATE TABLE Utilisateurs (
    idUtilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    mdp VARCHAR(255) NOT NULL,
    isDeleted BOOLEAN DEFAULT FALSE
);

-- Création de la table Projets
CREATE TABLE Projets (
    idProjet INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    deadline DATE,
    idCategorie INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idCategorie) REFERENCES Categories(idCategorie)
);

-- Création de la table Tâches
CREATE TABLE Taches (
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
    FOREIGN KEY (idAuteur) REFERENCES Utilisateurs(idUtilisateur),
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
);

-- Création de la table Notifications
CREATE TABLE Notifications (
    idNotification INT AUTO_INCREMENT PRIMARY KEY,
    idTache INT,
    priorite INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idTache) REFERENCES Taches(idTache)
);

-- Création de la table Fichiers
CREATE TABLE Fichiers (
    idFichier INT AUTO_INCREMENT PRIMARY KEY,
    idProjet INT,
    type VARCHAR(255),
    repertoire VARCHAR(255),
    isDeleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
);

-- Création de la table Projets_Utilisateurs (table de liaison n-n)
CREATE TABLE Projets_Utilisateurs (
    idUtilisateur INT,
    idProjet INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (idUtilisateur, idProjet),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    FOREIGN KEY (idProjet) REFERENCES Projets(idProjet)
);

-- Création de la table Taches_Utilisateurs (table de liaison n-n)
CREATE TABLE Taches_Utilisateurs (
    idUtilisateur INT,
    idTache INT,
    isDeleted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (idUtilisateur, idTache),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(idUtilisateur),
    FOREIGN KEY (idTache) REFERENCES Taches(idTache)
);
