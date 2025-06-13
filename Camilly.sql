-- CRIAR E USAR DATABASE
CREATE DATABASE IF NOT EXISTS sistema_notas;
USE sistema_notas;

-- CRIAÇÃO DE TABELAS

DROP TABLE IF EXISTS notas;
DROP TABLE IF EXISTS disciplinas;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS professores;

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_docente VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ra VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professores(id)
        ON DELETE SET NULL
);

CREATE TABLE notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
        ON DELETE CASCADE,
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
        ON DELETE CASCADE
);

-- INSERÇÃO DE DADOS

INSERT INTO professores (codigo_docente, nome) VALUES 
('DOC123', 'Camilly Anitta'),
('DOC124', 'Profª. Caua Carvalho');

INSERT INTO alunos (ra, nome) VALUES 
('RA001', 'Caio'),
('RA002', 'Ana');

INSERT INTO disciplinas (nome, professor_id) VALUES 
('Hitoria', 1),
('Espanhol', 2);

INSERT INTO notas (aluno_id, disciplina_id, nota) VALUES 
(1, 1, 5.5),
(2, 1, 5.5),
(1, 2, 7.5);











