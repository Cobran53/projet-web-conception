/* Dans le scénario nominal, les retours sont un JSON contenant le résultat de la requête. Sauf dans le cas des requêtes POST, auquel cas les données à mettre à jour
sont envoyés en JSON au serveur.*/


/* Utilisateurs (Users) */

/* GET /users/:id: Récupérer les informations d'un utilisateur spécifique. */
SELECT * FROM utilisateurs
WHERE isDeleted = FALSE 
AND idUtilisateur = 1; -- Exemple à remplacer

/* POST /users: Créer un nouvel utilisateur. */
INSERT INTO utilisateurs (nom, photo, email, mdp) VALUES 
("Test Test", "/test.jpg", "test@example.com", "motdepasse123");

/* PUT /users/:id: Mettre à jour les informations d'un utilisateur spécifique.*/
UPDATE utilisateurs
SET 
nom = "Test Test",
photo = "/test.jpg",
email = "test2@example.com",
mdp = "motdepasse123"
WHERE idUtilisateur = 4; -- Exemple à remplacer

/* DELETE /users/:id: Supprimer (désactiver) un utilisateur spécifique.*/
UPDATE utilisateurs
SET isDeleted = TRUE
WHERE idUtilisateur = 6; -- Exemple à remplacer

/* Projets (Projects)*/

/* GET /projects: Récupérer la liste de tous les projets.*/
SELECT * FROM projets
WHERE isDeleted = FALSE;

/* GET /projects/:id: Récupérer les informations d'un projet spécifique.*/
SELECT * FROM projets
WHERE isDeleted = FALSE
AND idProjet = 1; -- Exemple à remplacer

/* POST /projects: Créer un nouveau projet.*/
INSERT INTO projets (nom, deadline, idCategorie) VALUES 
('Projet Test', '2012-12-12', 1); -- Exemple à remplacer

/* PUT /projects/:id: Mettre à jour les informations d'un projet spécifique.*/
UPDATE projets
SET 
nom = 'Projet Test',
deadline = '2012-12-12',
idCategorie = 3
WHERE idProjet = 4; -- Exemple à remplacer

/* DELETE /projects/:id: Supprimer (désactiver) un projet spécifique.*/
UPDATE projets
SET isDeleted = TRUE
WHERE idProjet = 4; -- Exemple à remplacer

/* Catégories (Categories)*/

/* GET /categories: Récupérer la liste de toutes les catégories.*/
SELECT * FROM categories
WHERE isDeleted = FALSE;

/* GET /categories/:id: Récupérer les informations d'une catégorie spécifique.*/
SELECT * FROM categories
WHERE isDeleted = FALSE
AND idCategorie = 4; -- Exemple à remplacer

/* POST /categories: Créer une nouvelle catégorie.*/
INSERT INTO categories (libelle, couleur) VALUES
('Test', '#000000'); -- Exemple à remplacer

/* PUT /categories/:id: Mettre à jour les informations d'une catégorie spécifique.*/
UPDATE categories
SET 
libelle = 'Test',
couleur = '#000001'
WHERE idCategorie = 4; -- Exemple à remplacer

/* DELETE /categories/:id: Supprimer (désactiver) une catégorie spécifique.*/
UPDATE categories
SET 
isDeleted = TRUE
WHERE idCategorie = 4; -- Exemple à remplacer

/* Tâches (Tasks)*/
/* GET /project/:projectId/tasks: Récupérer la liste de toutes les tâches d'un projet spécifique.*/
SELECT * FROM taches
WHERE isDeleted = FALSE
AND idProjet = 1; -- Exemple à remplacer

/* GET /project/:projectId/tasks/:taskId: Récupérer les informations d'une tâche spécifique d'un projet.*/
SELECT * FROM taches
WHERE isDeleted = FALSE
AND idProjet = 1 -- Exemple à remplacer
AND idTache = 1; -- Exemple à remplacer

/* POST /project/:projectId/tasks: Créer une nouvelle tâche dans un projet spécifique.*/
INSERT INTO taches (idAuteur, idProjet, dateDebut, dateFin, titre, description, priorite, etat) VALUES
(1, 1, '2001-01-01', '2003-03-03', 'Test', 'testestestetsetsetsetsetsestestsets', 1, FALSE); -- Exemple à remplacer

/* PUT /project/:projectId/tasks/:taskId: Mettre à jour les informations d'une tâche spécifique d'un projet.*/
UPDATE taches
SET 
idAuteur = 1,
idProjet = 1,
dateDebut = '2001-01-01',
dateFin = '2003-03-03',
titre = 'Test',
description = 'testest',
priorite = 1,
etat = FALSE
WHERE idTache = 1 -- Exemple à remplacer
AND idProjet = 1; -- Exemple à remplacer

/* DELETE /project/:projectId/tasks/:taskId: Supprimer (désactiver) une tâche spécifique d'un projet.*/
UPDATE taches
SET 
isDeleted = TRUE
WHERE idTache = 1 -- Exemple à remplacer
AND idProjet = 1; -- Exemple à remplacer

/* Collaborateurs des Tâches (Task Collaborators)*/

/* GET /project/:projectId/tasks/:taskId/collaborators: Récupérer la liste des collaborateurs d'une tâche spécifique.*/
SELECT u.idUtilisateur, nom, photo, email, mdp, u.isDeleted FROM utilisateurs AS u
JOIN taches_utilisateurs AS tu ON tu.idUtilisateur = u.idUtilisateur
JOIN taches AS t ON t.idTache = tu.idTache
WHERE u.isDeleted = FALSE
AND tu.isDeleted = FALSE
AND t.isDeleted = FALSE
AND t.idTache = 1 -- Exemple à remplacer
AND t.idProjet = 1; -- Exemple à remplacer

/* POST /project/:projectId/tasks/:taskId/collaborators: Ajouter un collaborateur à une tâche spécifique.*/
INSERT INTO taches_utilisateurs (idUtilisateur, idTache) VALUES
(1,1); -- Exemple d'idUtilisateur et d'idTache à remplacer par les ID requis

/* DELETE /project/:projectId/tasks/:taskId/collaborators/:collaboratorId: Supprimer (désactiver) un collaborateur d'une tâche spécifique.*/
UPDATE taches_utilisateurs
SET 
isDeleted = TRUE
WHERE idTache = 1 -- Exemple à remplacer
AND idUtilisateur = 1; -- Exemple à remplacer

/* Affectation des Projets (Project Assignments)*/
 
/* GET /projects/:id/users: Récupérer la liste des utilisateurs assignés à un projet spécifique.*/
SELECT u.idUtilisateur, u.nom, photo, email, mdp, u.isDeleted FROM utilisateurs AS u
JOIN projets_utilisateurs AS pu ON pu.idUtilisateur = u.idUtilisateur
JOIN projets AS p ON p.idProjet = pu.idProjet
WHERE p.isDeleted = FALSE
AND pu.isDeleted = FALSE
AND u.isDeleted = FALSE
AND p.idProjet = 1; -- Exemple à remplacer

/* POST /projects/:id/users: Assigner un utilisateur à un projet spécifique.*/
INSERT INTO projets_utilisateurs (idUtilisateur, idProjet) VALUES
(1, 1); -- Exemple à remplacer

/* DELETE /projects/:id/users/:userId: Supprimer (désactiver) un utilisateur d'un projet spécifique.*/
UPDATE projets_utilisateurs
SET
isDeleted = TRUE
WHERE idProjet = 1 -- Exemple à remplacer
AND idUtilisateur = 1; -- Exemple à remplacer

/* Notifications*/
/* GET /notifications: Récupérer la liste de toutes les notifications.*/
SELECT * FROM notifications
WHERE isDeleted = FALSE;

/* GET /notifications/:id: Récupérer les informations d'une notification spécifique.*/
SELECT * FROM notifications
WHERE isDeleted = FALSE
AND idNotification = 1; -- Exemple à remplacer

/* POST /notifications: Créer une nouvelle notification.*/
INSERT INTO notifications (idTache, priorite) VALUES
(1, 1); -- Exemple à remplacer

/* PUT /notifications/:id: Mettre à jour les informations d'une notification spécifique.*/
UPDATE notifications
SET
priorite = 1
WHERE idNotification = 1; -- Exemple à remplacer

/* DELETE /notifications/:id: Supprimer (désactiver) une notification spécifique.*/
UPDATE notifications
SET
isDeleted = TRUE
WHERE idNotification = 1; -- Exemple à remplacer

/* Fichiers (Files)*/

/* GET /projects/:projectId/files: Récupérer la liste de tous les fichiers d'un projet spécifique.*/
SELECT * FROM fichiers
WHERE isDeleted = FALSE
AND idProjet = 1; -- Exemple à remplacer

/* GET /projects/:projectId/files/:fileId: Récupérer les informations d'un fichier spécifique d'un projet.*/
SELECT * FROM fichiers
WHERE isDeleted = FALSE
AND idProjet = 1 -- Exemple à remplacer
AND idFichier = 1; -- Exemple à remplacer

/* POST /projects/:projectId/files: Ajouter un nouveau fichier à un projet spécifique.*/
INSERT INTO fichiers (idProjet, type, repertoire) VALUES
(1, 'document', '/docs/alpha_requirements.pdf'); -- Exemple à remplacer

/* DELETE /projects/:projectId/files/:fileId: Supprimer (désactiver) un fichier spécifique d'un projet.*/
UPDATE fichiers
SET
isDeleted = TRUE
WHERE idFichier = 1; -- Exemple à remplacer