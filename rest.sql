/* API RESTful
Les requêtes données ici sont des exemples, et seront à modifier avec le contenu de la requête.
*/

/* Utilisateurs (Users) */

/* GET /users: Récupérer la liste de tous les utilisateurs. */
SELECT * FROM utilisateurs
WHERE isDeleted = FALSE;

/* GET /users/:id: Récupérer les informations d'un utilisateur spécifique. */
SELECT * FROM utilisateurs
WHERE isDeleted = FALSE 
AND idUtilisateur = 1;

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
WHERE idUtilisateur = 4;

/* DELETE /users/:id: Supprimer (désactiver) un utilisateur spécifique.*/
UPDATE utilisateurs
SET isDeleted = TRUE
WHERE idUtilisateur = 6;

/* Projets (Projects)*/

/* GET /projects: Récupérer la liste de tous les projets.*/
SELECT * FROM projets
WHERE isDeleted = FALSE;

/* GET /projects/:id: Récupérer les informations d'un projet spécifique.*/
SELECT * FROM projets
WHERE isDeleted = FALSE
AND idProjet = 1;

/* POST /projects: Créer un nouveau projet.*/
INSERT INTO projets (nom, deadline, idCategorie) VALUES 
('Projet Test', '2012-12-12', 1);

/* PUT /projects/:id: Mettre à jour les informations d'un projet spécifique.*/
UPDATE projets
SET 
nom = 'Projet Test',
deadline = '2012-12-12',
idCategorie = 3
WHERE idProjet = 4;

/* DELETE /projects/:id: Supprimer (désactiver) un projet spécifique.*/
UPDATE projets
SET isDeleted = TRUE
WHERE idProjet = 4;

/* Catégories (Categories)*/

/* GET /categories: Récupérer la liste de toutes les catégories.*/
SELECT * FROM categories
WHERE isDeleted = FALSE;

/* GET /categories/:id: Récupérer les informations d'une catégorie spécifique.*/
SELECT * FROM categories
WHERE isDeleted = FALSE
AND idCategorie = 4;

/* POST /categories: Créer une nouvelle catégorie.*/
INSERT INTO categories (libelle, couleur) VALUES
('Test', '#000000');

/* PUT /categories/:id: Mettre à jour les informations d'une catégorie spécifique.*/
UPDATE categories
SET 
libelle = 'Test',
couleur = '#000001'
WHERE idCategorie = 4;

/* DELETE /categories/:id: Supprimer (désactiver) une catégorie spécifique.*/
UPDATE categories
SET 
isDeleted = TRUE
WHERE idCategorie = 4;

/* Tâches (Tasks)*/
/* GET /project/:projectId/tasks: Récupérer la liste de toutes les tâches d'un projet spécifique.*/
SELECT * FROM taches
WHERE isDeleted = FALSE;
AND idProjet = 1;

/* GET /project/:projectId/tasks/:taskId: Récupérer les informations d'une tâche spécifique d'un projet.*/
SELECT * FROM taches
WHERE isDeleted = FALSE
AND idProjet = 1
AND idTache = 1;

/* POST /project/:projectId/tasks: Créer une nouvelle tâche dans un projet spécifique.*/
INSERT INTO Taches (idAuteur, idProjet, dateDebut, dateFin, titre, description, priorite, etat) VALUES
(1, 1, '2001-01-01', '2003-03-03', 'Test', 'testestestetsetsetsetsetsestestsets', 1, FALSE);


/* PUT /project/:projectId/tasks/:taskId: Mettre à jour les informations d'une tâche spécifique d'un projet.*/
/* DELETE /project/:projectId/tasks/:taskId: Supprimer (désactiver) une tâche spécifique d'un projet.*/
/* Collaborateurs des Tâches (Task Collaborators)*/
/* GET /project/:projectId/tasks/:taskId/collaborators: Récupérer la liste des collaborateurs d'une tâche spécifique.*/
/* POST /project/:projectId/tasks/:taskId/collaborators: Ajouter un collaborateur à une tâche spécifique.*/
/* DELETE /project/:projectId/tasks/:taskId/collaborators/:collaboratorId: Supprimer (désactiver) un collaborateur d'une tâche spécifique.*/
/* Affectation des Projets (Project Assignments)*/
/* GET /projects/:id/users: Récupérer la liste des utilisateurs assignés à un projet spécifique.*/
/* POST /projects/:id/users: Assigner un utilisateur à un projet spécifique.*/
/* DELETE /projects/:id/users/:userId: Supprimer (désactiver) un utilisateur d'un projet spécifique.*/
/* Notifications*/
/* GET /notifications: Récupérer la liste de toutes les notifications.*/
/* GET /notifications/:id: Récupérer les informations d'une notification spécifique.*/
/* POST /notifications: Créer une nouvelle notification.*/
/* PUT /notifications/:id: Mettre à jour les informations d'une notification spécifique.*/
/* DELETE /notifications/:id: Supprimer (désactiver) une notification spécifique.*/
/* Fichiers (Files)*/
/* GET /projects/:projectId/files: Récupérer la liste de tous les fichiers d'un projet spécifique.*/
/* GET /projects/:projectId/files/:fileId: Récupérer les informations d'un fichier spécifique d'un projet.*/
/* POST /projects/:projectId/files: Ajouter un nouveau fichier à un projet spécifique.*/
/* DELETE /projects/:projectId/files/:fileId: Supprimer (désactiver) un fichier spécifique d'un projet.