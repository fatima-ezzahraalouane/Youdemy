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

CREATE TABLE tag (
    id_tag INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE cours (
    id_cours INT NOT null AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT null,
    image_url VARCHAR(250) NOT NULL,
    contenu TEXT, -- Lien vers une vidéo ou un document
    id_usersite INT NOT NULL, -- L'enseignant qui a créé le cours
    id_categorie INT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('en_attente', 'publie', 'rejete') DEFAULT 'en_attente', -- Statut du cours
    FOREIGN KEY (id_enseignant) REFERENCES usersite(id_usersite) ON DELETE CASCADE,
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie) ON DELETE SET NULL
);

CREATE TABLE cours_tag (
    id_cours_tag INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cours INT NOT NULL,
    id_tag INT NOT NULL,
    UNIQUE KEY cours_tag_unique (id_cours, id_tag),
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours) ON DELETE CASCADE,
    FOREIGN KEY (id_tag) REFERENCES tag(id_tag) ON DELETE CASCADE
);

CREATE TABLE inscription (
    id_inscription INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usersite INT NOT NULL,
    id_cours INT NOT NULL,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usersite) REFERENCES usersite(id_usersite) ON DELETE CASCADE,
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours) ON DELETE CASCADE
);