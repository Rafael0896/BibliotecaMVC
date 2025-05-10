-- Eliminar la base de datos si existe para comenzar desde cero
-- DROP DATABASE IF EXISTS biblioteca;

-- Crear la base de datos
CREATE DATABASE biblioteca;
USE biblioteca;

-- Crear la tabla base ElementoBiblioteca con restricciones UNIQUE
CREATE TABLE ElementoBiblioteca (
                                    id INT AUTO_INCREMENT PRIMARY KEY,
                                    titulo VARCHAR(200) NOT NULL,
                                    autor VARCHAR(100) NOT NULL,
                                    ano_publicacion INT NOT NULL,
                                    tipo VARCHAR(20) NOT NULL COMMENT 'LIBRO, REVISTA o DVD',
                                    CONSTRAINT unique_elemento UNIQUE (titulo, autor, ano_publicacion, tipo)
);

-- Crear la tabla Libro con ISBN único
CREATE TABLE Libro (
                       id INT PRIMARY KEY,
                       isbn VARCHAR(20) NOT NULL,
                       numero_paginas INT NOT NULL,
                       genero VARCHAR(50) NOT NULL,
                       editorial VARCHAR(100) NOT NULL,
                       FOREIGN KEY (id) REFERENCES ElementoBiblioteca(id) ON DELETE CASCADE,
                       CONSTRAINT unique_isbn UNIQUE (isbn)
);

-- Crear la tabla Revista
CREATE TABLE Revista (
                         id INT PRIMARY KEY,
                         numero_edicion INT NOT NULL,
                         categoria VARCHAR(50) NOT NULL,
                         FOREIGN KEY (id) REFERENCES ElementoBiblioteca(id) ON DELETE CASCADE
);

-- Crear la tabla DVD
CREATE TABLE DVD (
                     id INT PRIMARY KEY,
                     duracion INT NOT NULL,
                     genero VARCHAR(50) NOT NULL,
                     FOREIGN KEY (id) REFERENCES ElementoBiblioteca(id) ON DELETE CASCADE
);

-- Uso de la base de datos
USE biblioteca;

-- Insertar datos de ejemplo para libros
INSERT INTO ElementoBiblioteca (titulo, autor, ano_publicacion, tipo) VALUES
                                                                          ('Cien años de soledad', 'Gabriel García Márquez', 1967, 'LIBRO'),
                                                                          ('El código Da Vinci', 'Dan Brown', 2003, 'LIBRO'),
                                                                          ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 1997, 'LIBRO'),
                                                                          ('1984', 'George Orwell', 1949, 'LIBRO'),
                                                                          ('El principito', 'Antoine de Saint-Exupéry', 1943, 'LIBRO'),
                                                                          ('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605, 'LIBRO'),
                                                                          ('La sombra del viento', 'Carlos Ruiz Zafón', 2001, 'LIBRO'),
                                                                          ('Crimen y castigo', 'Fiódor Dostoyevski', 1866, 'LIBRO'),
                                                                          ('El señor de los anillos', 'J.R.R. Tolkien', 1954, 'LIBRO'),
                                                                          ('Sapiens: De animales a dioses', 'Yuval Noah Harari', 2014, 'LIBRO'),
                                                                          ('La Odisea', 'Homero', -800, 'LIBRO'),
                                                                          ('El Hobbit', 'J.R.R. Tolkien', 1937, 'LIBRO'),
                                                                          ('Orgullo y prejuicio', 'Jane Austen', 1813, 'LIBRO'),
                                                                          ('Los juegos del hambre', 'Suzanne Collins', 2008, 'LIBRO'),
                                                                          ('El gran Gatsby', 'F. Scott Fitzgerald', 1925, 'LIBRO'),
                                                                          ('Matar a un ruiseñor', 'Harper Lee', 1960, 'LIBRO'),
                                                                          ('El alquimista', 'Paulo Coelho', 1988, 'LIBRO'),
                                                                          ('Drácula', 'Bram Stoker', 1897, 'LIBRO'),
                                                                          ('El retrato de Dorian Gray', 'Oscar Wilde', 1890, 'LIBRO'),
                                                                          ('La Metamorfosis', 'Franz Kafka', 1915, 'LIBRO');

-- Insertar datos para la tabla Libro
INSERT INTO Libro (id, isbn, numero_paginas, genero, editorial) VALUES
                                                                    (1, '978-0307474728', 432, 'Realismo mágico', 'Editorial Sudamericana'),
                                                                    (2, '978-0307474529', 689, 'Thriller', 'Doubleday'),
                                                                    (3, '978-0747532743', 223, 'Fantasía', 'Bloomsbury'),
                                                                    (4, '978-0451524935', 328, 'Distopía', 'Secker & Warburg'),
                                                                    (5, '978-0156012195', 96, 'Literatura infantil', 'Reynal & Hitchcock'),
                                                                    (6, '978-8420412146', 863, 'Novela', 'Francisco de Robles'),
                                                                    (7, '978-0143034902', 487, 'Misterio', 'Planeta'),
                                                                    (8, '978-0143058144', 671, 'Novela psicológica', 'The Russian Messenger'),
                                                                    (9, '978-0618640157', 1178, 'Fantasía épica', 'Allen & Unwin'),
                                                                    (10, '978-0062316097', 443, 'Historia', 'Debate'),
                                                                    (11, '978-0140268867', 541, 'Epopeya', 'Clásicos Universales'),
                                                                    (12, '978-0618260300', 310, 'Fantasía', 'Allen & Unwin'),
                                                                    (13, '978-0141439518', 432, 'Novela romántica', 'T. Egerton'),
                                                                    (14, '978-0439023528', 374, 'Ciencia ficción', 'Scholastic'),
                                                                    (15, '978-0743273565', 180, 'Novela', 'Charles Scribner\'s Sons'),
(16, '978-0061120084', 324, 'Novela', 'J. B. Lippincott & Co.'),
(17, '978-0062315007', 208, 'Ficción filosófica', 'HarperOne'),
(18, '978-0141439846', 418, 'Terror gótico', 'Archibald Constable and Company'),
(19, '978-0141439570', 272, 'Novela gótica', 'Ward, Lock and Company'),
(20, '978-0141197968', 128, 'Ficción absurda', 'Kurt Wolff Verlag');

-- Insertar datos de ejemplo para revistas
INSERT INTO ElementoBiblioteca (titulo, autor, ano_publicacion, tipo) VALUES
('National Geographic', 'National Geographic Society', 2023, 'REVISTA'),
('Time', 'Time USA, LLC', 2023, 'REVISTA'),
('Scientific American', 'Springer Nature', 2023, 'REVISTA'),
('Vogue', 'Condé Nast', 2023, 'REVISTA'),
('The Economist', 'The Economist Group', 2023, 'REVISTA'),
('Wired', 'Condé Nast', 2023, 'REVISTA'),
('Forbes', 'Forbes Media', 2023, 'REVISTA'),
('National Geographic Historia', 'National Geographic Society', 2022, 'REVISTA'),
('Rolling Stone', 'Penske Media Corporation', 2023, 'REVISTA'),
('Sports Illustrated', 'Authentic Brands Group', 2023, 'REVISTA'),
('Architectural Digest', 'Condé Nast', 2023, 'REVISTA'),
('Popular Science', 'Bonnier Corporation', 2023, 'REVISTA'),
('New Scientist', 'New Scientist Ltd', 2023, 'REVISTA'),
('Psychology Today', 'Sussex Publishers', 2023, 'REVISTA'),
('Harvard Business Review', 'Harvard Business Publishing', 2023, 'REVISTA');

-- Insertar datos para la tabla Revista
INSERT INTO Revista (id, numero_edicion, categoria) VALUES
(21, 324, 'Ciencia y naturaleza'),
(22, 1789, 'Actualidad'),
(23, 456, 'Ciencia'),
(24, 890, 'Moda'),
(25, 9543, 'Economía'),
(26, 356, 'Tecnología'),
(27, 732, 'Negocios'),
(28, 45, 'Historia'),
(29, 1392, 'Música'),
(30, 567, 'Deportes'),
(31, 234, 'Arquitectura'),
(32, 879, 'Ciencia y tecnología'),
(33, 3423, 'Ciencia'),
(34, 678, 'Psicología'),
(35, 432, 'Negocios');

-- Insertar datos de ejemplo para DVDs
INSERT INTO ElementoBiblioteca (titulo, autor, ano_publicacion, tipo) VALUES
('El Padrino', 'Francis Ford Coppola', 1972, 'DVD'),
('Titanic', 'James Cameron', 1997, 'DVD'),
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 2003, 'DVD'),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'DVD'),
('Parásitos', 'Bong Joon-ho', 2019, 'DVD'),
('El Viaje de Chihiro', 'Hayao Miyazaki', 2001, 'DVD'),
('Origen', 'Christopher Nolan', 2010, 'DVD'),
('El Caballero Oscuro', 'Christopher Nolan', 2008, 'DVD'),
('Matrix', 'Lana y Lilly Wachowski', 1999, 'DVD'),
('Gladiador', 'Ridley Scott', 2000, 'DVD'),
('La lista de Schindler', 'Steven Spielberg', 1993, 'DVD'),
('El Rey León', 'Rob Minkoff, Roger Allers', 1994, 'DVD'),
('Interestelar', 'Christopher Nolan', 2014, 'DVD'),
('Ciudad de Dios', 'Fernando Meirelles', 2002, 'DVD'),
('El Silencio de los Corderos', 'Jonathan Demme', 1991, 'DVD');

-- Insertar datos para la tabla DVD
INSERT INTO DVD (id, duracion, genero) VALUES
(36, 175, 'Drama'),
(37, 195, 'Romance'),
(38, 201, 'Fantasía'),
(39, 154, 'Crimen'),
(40, 132, 'Drama'),
(41, 125, 'Animación'),
(42, 148, 'Ciencia ficción'),
(43, 152, 'Acción'),
(44, 136, 'Ciencia ficción'),
(45, 155, 'Acción'),
(46, 195, 'Drama histórico'),
(47, 88, 'Animación'),
(48, 169, 'Ciencia ficción'),
(49, 130, 'Drama'),
(50, 118, 'Thriller psicológico');

-- Crear índices para mejorar el rendimiento
CREATE INDEX idx_elementobiblioteca_tipo ON ElementoBiblioteca(tipo);
CREATE INDEX idx_elementobiblioteca_titulo ON ElementoBiblioteca(titulo);
CREATE INDEX idx_elementobiblioteca_autor ON ElementoBiblioteca(autor);
CREATE INDEX idx_libro_genero ON Libro(genero);
CREATE INDEX idx_revista_categoria ON Revista(categoria);
CREATE INDEX idx_dvd_genero ON DVD(genero);

-- Procedimiento almacenado para buscar elementos por título
DELIMITER //
CREATE PROCEDURE BuscarPorTitulo(IN p_titulo VARCHAR(200))
BEGIN
SELECT e.id, e.titulo, e.autor, e.ano_publicacion, e.tipo
FROM ElementoBiblioteca e
WHERE e.titulo LIKE CONCAT('%', p_titulo, '%')
ORDER BY e.titulo;
END //
DELIMITER ;

-- Procedimiento almacenado para buscar elementos por autor
DELIMITER //
CREATE PROCEDURE BuscarPorAutor(IN p_autor VARCHAR(100))
BEGIN
SELECT e.id, e.titulo, e.autor, e.ano_publicacion, e.tipo
FROM ElementoBiblioteca e
WHERE e.autor LIKE CONCAT('%', p_autor, '%')
ORDER BY e.autor, e.titulo;
END //
DELIMITER ;

-- Procedimiento almacenado para obtener estadísticas de la biblioteca
DELIMITER //
CREATE PROCEDURE ObtenerEstadisticas()
BEGIN
SELECT
    COUNT(*) as total_elementos,
    SUM(CASE WHEN tipo = 'LIBRO' THEN 1 ELSE 0 END) as total_libros,
    SUM(CASE WHEN tipo = 'REVISTA' THEN 1 ELSE 0 END) as total_revistas,
    SUM(CASE WHEN tipo = 'DVD' THEN 1 ELSE 0 END) as total_dvds
FROM ElementoBiblioteca;
END //
DELIMITER ;