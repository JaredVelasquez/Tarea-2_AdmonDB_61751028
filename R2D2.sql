-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'R2D2'
)
CREATE DATABASE DatabaseName
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Robot', 'U') IS NOT NULL
DROP TABLE dbo.Robot
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Robot
(
    Robot_id INT NOT NULL, -- primary key column
    Work_id [INT] NOT NULL,
    Stage_id [INT] NOT NULL,
    Orientation_id [INT] NOT NULL,
    States [BOOLEAN](50) NOT NULL,
    Coordinate_X [REAL](50) NOT NULL,
    Coordinate_Y [REAL](50) NOT NULL,
    CONSTRAINT pk_Robot PRIMARY KEY (Roborid,Work_id,Stage_id)
    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Stage', 'U') IS NOT NULL
DROP TABLE dbo.Stage
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Stage
(
    Stage_id INT NOT NULL, -- primary key column
    Names [NVARCHAR](50) NOT NULL,
    Pocition_start [NVARCHAR](50) NOT NULL,
    Pocition_final [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_Escenario PRIMARY KEY (Escenario_id)

    -- specify more columns here
);
GO
sql
-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Orientation', 'U') IS NOT NULL
DROP TABLE dbo.Orientation
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Orientation
(
    Orientation_id INT NOT NULL, -- primary key column
    NORTH [NVARCHAR](50) NOT NULL,
    SOUTH [NVARCHAR](50) NOT NULL,
    WEST [NVARCHAR](50) NOT NULL,
    EAST [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_Orientacion PRIMARY KEY (Orientacion_id)
    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.WORK', 'U') IS NOT NULL
DROP TABLE dbo.WORK
GO
-- Create the table in the specified schema
CREATE TABLE dbo.WORK
(
    Work_id INT NOT NULL, -- primary key column
    Descriptions [NVARCHAR](50) NOT NULL,
    Priority [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_WORK PRIMARY KEY (Work_id)
    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Sensor', 'U') IS NOT NULL
DROP TABLE dbo.Sensor
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Sensor
(
    Sensor_id INT NOT NULL,
    SensorVisual_id [INT] NOT NULL,
    SensorProximity_id [INT] NOT NULL,
    CONSTRAINT pk_Sensor PRIMARY KEY (Sensor_id)
    -- specify more columns here
);
GO
-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SensorVisual', 'U') IS NOT NULL
DROP TABLE dbo.SensorVisual
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SensorVisual
(
    SensorVisual_id INT NOT NULL, -- primary key column
    Resolution [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_SensorVisual PRIMARY KEY (SensorVisual_id)
    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SensorProximity', 'U') IS NOT NULL
DROP TABLE dbo.SensorProximity
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SensorProximity
(
    SensorProximity_id INT NOT NULL, -- primary key column
    Minimal_distance [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_SensorProximity PRIMARY KEY (SensorProximity_id)
    -- specify more columns here
);
GO

-- Select rows from a Table or View 'visitaMedica' in schema 'dbo'
SELECT * FROM dbo.Robot
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'visitaDoctor' in schema 'dbo'
SELECT * FROM dbo.Stage
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.Orientation
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.WORK
--WHERE 	/* add search conditions here */
GO-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.Sensor
--WHERE 	/* add search conditions here */
GO-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.SensorVisual
--WHERE 	/* add search conditions here */
GO-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.SensorProximity
--WHERE 	/* add search conditions here */
GO