En esta carpeta pueden encontrar dos scripts:

1) Creación de la base de datos

Mediante este script se creó la base de datos con sus cuatro tablas respectivas. A cada campo se le asignó un tipo de dato (TINYINT, SMALLINT, INT, BIGINT, DECIMAL, NVARCHAR, etc.) en función de su contenido, con el objetivo de almacenar la información de manera eficiente. A cada tabla se le asignó un campo Primary Key (que se corresponde con un ID) y en la Tabla de Hechos se especificaron también los campos que funcionan como Foreign Key, para establecer la relación con las otras tres entidades.

2) Inserción de registros

La inserción se realizó utilizando el comando BULK INSERT para cada una de las cuatro tablas que se encuentran en formato CSV en la carpeta contigua.
