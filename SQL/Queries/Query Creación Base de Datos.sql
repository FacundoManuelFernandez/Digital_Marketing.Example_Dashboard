CREATE DATABASE MarketingDB;
GO

USE MarketingDB;
GO


-- Creación tabla Campaña
CREATE TABLE Campaña (
	ID_NombreCampaña TINYINT PRIMARY KEY,
	Campaña NVARCHAR(50)
);

-- Creación tabla Categoría
CREATE TABLE Categoria (
    ID_Categoria TINYINT PRIMARY KEY,
    Categoria NVARCHAR(15)
);

-- Creación tabla Medio
CREATE TABLE Medio (
    ID_Medio TINYINT PRIMARY KEY,
    Medio NVARCHAR(15)
);

-- Creación Tabla de Hechos
CREATE TABLE TablaDeHechos (
    ID_Data SMALLINT PRIMARY KEY,
    Fecha DATE,
    ID_NombreCampaña TINYINT,
    ID_Categoria TINYINT,
    ID_Medio TINYINT,
	ID_Campaña INT,
    Impresiones BIGINT,
    Inversion_Marketing DECIMAL(18, 2),
    Clics INT,
    Suscripciones SMALLINT,
    Ventas SMALLINT,
    Ingresos INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Medio) REFERENCES Medio(ID_Medio),
	FOREIGN KEY (ID_NombreCampaña) REFERENCES Campaña(ID_NombreCampaña)
);
GO
