-- Importar en phpMyAdmin: crea una base nueva llamada star_wars_aula.
    -- Si ya tenés una base con ese nombre y otra estructura, usá un nombre nuevo
    -- tanto aquí (CREATE DATABASE y USE) como en app/database.py. No borres tu trabajo.
    CREATE DATABASE IF NOT EXISTS star_wars_aula
        CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    USE star_wars_aula;

    -- TABLAS 1, 2 y 3: guardan datos que varios personajes pueden compartir.
    CREATE TABLE IF NOT EXISTS categorias (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL UNIQUE
    ) ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS especies (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL UNIQUE
    ) ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS planetas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL UNIQUE
    ) ENGINE=InnoDB;

    -- TABLA 4: cada personaje se relaciona con las otras tres mediante sus IDs.
    -- PRIMARY KEY identifica la fila; FOREIGN KEY apunta a una fila de otra tabla.
    CREATE TABLE IF NOT EXISTS personajes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL UNIQUE,
        categoria_id INT NOT NULL,
        especie_id INT NOT NULL,
        planeta_id INT NOT NULL,
        descripcion TEXT NOT NULL,
        imagen VARCHAR(150) NOT NULL DEFAULT 'personaje.svg',
        FOREIGN KEY (categoria_id) REFERENCES categorias(id),
        FOREIGN KEY (especie_id) REFERENCES especies(id),
        FOREIGN KEY (planeta_id) REFERENCES planetas(id)
    ) ENGINE=InnoDB;

    -- Primero se cargan las tablas referenciadas, después los personajes.
    -- IDs explícitos para facilitar la lectura de las relaciones del ejemplo.
    -- IGNORE permite reimportar esta misma muestra sin duplicar los registros.
    -- No actualiza registros existentes: para modificarlos, usá Editar en phpMyAdmin.
    INSERT IGNORE INTO categorias (id, nombre) VALUES
        (1, 'Jedi'), (2, 'Sith'), (3, 'Droides'), (4, 'Cazarrecompensas');
    INSERT IGNORE INTO especies (id, nombre) VALUES
        (1, 'Humano'), (2, 'Desconocida'), (3, 'Droide astromecánico'),
        (4, 'Droide de protocolo'), (5, 'Trandoshano');
    INSERT IGNORE INTO planetas (id, nombre) VALUES
        (1, 'Tatooine'), (2, 'Desconocido'), (3, 'Naboo'),
        (4, 'Naboo (fabricación)'), (5, 'Kamino'), (6, 'Trandosha');

    -- Para droides, planeta indica el lugar de fabricación/origen del ejemplo.
    -- No confundimos lugar de origen con residencia actual.
    INSERT IGNORE INTO personajes
        (id, nombre, categoria_id, especie_id, planeta_id, descripcion, imagen)
    VALUES
(1, 'Luke Skywalker', 1, 1, 1, 'Luke crece en Tatooine y comienza un viaje que lo lleva a descubrir la Fuerza. Aprende de Obi-Wan Kenobi y de Yoda, y participa en la lucha de la Alianza Rebelde contra el Imperio.', 'personaje.svg'),
(2, 'Yoda', 1, 2, 2, 'Yoda es un maestro Jedi con una larga experiencia en el uso de la Fuerza. Enseña a distintas generaciones y guía a Luke durante su entrenamiento en Dagobah.', 'personaje.svg'),
(3, 'Darth Vader', 2, 1, 1, 'Darth Vader sirve al Imperio y es uno de los principales representantes del lado oscuro. Antes de convertirse en Sith fue Anakin Skywalker, un caballero Jedi.', 'personaje.svg'),
(4, 'Darth Sidious', 2, 1, 3, 'Darth Sidious es la identidad Sith de Palpatine. Manipula los conflictos de la galaxia para aumentar su poder y transforma la República en el Imperio Galáctico.', 'personaje.svg'),
(5, 'R2-D2', 3, 3, 4, 'R2-D2 es un droide astromecánico que ayuda a reparar naves y resolver problemas técnicos. Acompaña a varios protagonistas y participa en importantes misiones.', 'personaje.svg'),
(6, 'C-3PO', 3, 4, 1, 'C-3PO es un droide de protocolo especializado en comunicación y traducción. Su compañero habitual es R2-D2, con quien atraviesa numerosas aventuras.', 'personaje.svg'),
(7, 'Boba Fett', 4, 1, 5, 'Boba Fett es un cazarrecompensas conocido por su armadura y su habilidad para rastrear objetivos. Realiza trabajos para distintos clientes y viaja por la galaxia.', 'personaje.svg'),
(8, 'Bossk', 4, 5, 6, 'Bossk es un cazarrecompensas trandoshano. Se dedica a localizar objetivos y es uno de los mercenarios convocados por Darth Vader para perseguir al Halcón Milenario.', 'personaje.svg');
