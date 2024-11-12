CREATE DATABASE MarketingDB;
GO

USE MarketingDB;
GO


-- Creaci�n tabla Campa�a
CREATE TABLE Campa�a (
	ID_NombreCampa�a TINYINT PRIMARY KEY,
	Campa�a NVARCHAR(50)
);

-- Creaci�n tabla Categor�a
CREATE TABLE Categoria (
    ID_Categoria TINYINT PRIMARY KEY,
    Categoria NVARCHAR(15)
);

-- Creaci�n tabla Medio
CREATE TABLE Medio (
    ID_Medio TINYINT PRIMARY KEY,
    Medio NVARCHAR(15)
);

-- Creaci�n Tabla de Hechos
CREATE TABLE TablaDeHechos (
    ID_Data SMALLINT PRIMARY KEY,
    Fecha DATE,
    ID_NombreCampa�a TINYINT,
    ID_Categoria TINYINT,
    ID_Medio TINYINT,
	ID_Campa�a INT,
    Impresiones BIGINT,
    Inversion_Marketing DECIMAL(18, 2),
    Clics INT,
    Suscripciones SMALLINT,
    Ventas SMALLINT,
    Ingresos INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Medio) REFERENCES Medio(ID_Medio),
	FOREIGN KEY (ID_NombreCampa�a) REFERENCES Campa�a(ID_NombreCampa�a)
);
GO
