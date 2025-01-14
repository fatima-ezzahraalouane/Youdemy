CREATE DATABASE youdemy;

USE youdemy;

CREATE TABLE role (
    id_role int NOT null AUTO_INCREMENT PRIMARY KEY,
    name_user ENUM('Admin', 'Étudiant', 'Enseignant') NOT NULL
);

CREATE TABLE usersite (
    id_usersite INT NOT null AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL UNIQUE,
    id_role INT NOT NULL,
    statut ENUM('actif', 'inactif', 'suspendu') DEFAULT 'actif', -- Statut du compte
    is_approved BOOLEAN DEFAULT FALSE, -- Indique si le compte de l'enseignant est approuvé (TRUE) ou en attente (FALSE)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_role) REFERENCES role(id_role)
);

CREATE TABLE categorie (
    id_categorie INT not null PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL UNIQUE,
    image_url VARCHAR(250) NOT NULL
);