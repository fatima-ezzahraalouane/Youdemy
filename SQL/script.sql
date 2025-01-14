CREATE DATABASE youdemy;

USE youdemy;

CREATE TABLE role (
    id_role int NOT null AUTO_INCREMENT PRIMARY KEY,
    name_user ENUM('Admin', 'Étudiant', 'Enseignant') NOT NULL
);