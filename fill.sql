USE gestion_projets;

-- Insertion de données fictives dans la table Catégories
INSERT INTO Categories (libelle, couleur) VALUES
('Projets scolaires', '#FF5733'),
('Projets de clubs', '#33FF57'),
('Projets perso', '#3357FF');

-- Insertion de données fictives dans la table Utilisateurs
INSERT INTO Utilisateurs (nom, photo, email, mdp) VALUES
('Alice Dupont', '/photos/alice.jpg', 'alice.dupont@example.com', 'motdepasse123'),
('Bob Martin', '/photos/bob.jpg', 'bob.martin@example.com', 'motdepasse123'),
('Charlie Leblanc', '/photos/charlie.jpg', 'charlie.leblanc@example.com', 'motdepasse123');

-- Insertion de données fictives dans la table Projets
INSERT INTO Projets (nom, deadline, idCategorie) VALUES
('Projet SQL', '2024-12-31', 1),
('Projet jeu', '2024-06-30', 3),
('Projet BDE', '2024-09-15', 2);

-- Insertion de données fictives dans la table Taches
INSERT INTO Taches (idAuteur, idProjet, dateDebut, dateFin, titre, description, priorite, etat) VALUES
(1, 1, '2024-01-01', '2024-03-01', 'Création de la base de données', 'Création de la base de données', 1, FALSE),
(2, 1, '2024-03-01', '2024-05-01', 'Développement frontend', 'Développement frontend', 2, FALSE),
(3, 3, '2024-02-01', '2024-04-01', 'Création des afffiches', 'Création des afffiches', 1, FALSE),
(1, 2, '2024-05-01', '2024-07-01', 'Campagne marketing', 'Lancer la campagne marketing pour le jeua', 3, TRUE);

-- Insertion de données fictives dans la table Notifications
INSERT INTO Notifications (idTache, priorite) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertion de données fictives dans la table Fichiers
INSERT INTO Fichiers (idProjet, type, repertoire) VALUES
(1, 'document', '/docs/alpha_requirements.pdf'),
(3, 'image', '/images/affiche.png'),
(2, 'document', '/docs/gamma_marketing_plan.pdf');

-- Insertion de données fictives dans la table Projets_Utilisateurs
INSERT INTO Projets_Utilisateurs (idUtilisateur, idProjet) VALUES
(1, 1),
(2, 1),
(3, 2),
(1, 3),
(2, 3),
(3, 3);

-- Insertion de données fictives dans la table Taches_Utilisateurs
INSERT INTO Taches_Utilisateurs (idUtilisateur, idTache) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 4),
(3, 4);
