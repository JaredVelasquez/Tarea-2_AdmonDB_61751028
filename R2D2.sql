-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'R2D24'
)
CREATE DATABASE R2D24
GO
-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Pocition_start', 'U') IS NOT NULL
DROP TABLE dbo.Pocition_start
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Pocition_start
(
    Pocition_start_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- primary key column
    Coordinate_X1 [NVARCHAR](50) NOT NULL,
    Coordinate_Y1 [NVARCHAR](50) NOT NULL

    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Pocition_final', 'U') IS NOT NULL
DROP TABLE dbo.Pocition_final
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Pocition_final
(
    Pocition_final_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- primary key column
    Coordinate_X2 [NVARCHAR](50) NOT NULL,
    Coordinate_Y2 [NVARCHAR](50) NOT NULL
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
    Stage_id INT NOT NULL IDENTITY(1,1), -- primary key column
    Names [NVARCHAR](50) NOT NULL,
    Pocition_start_id [INT] NOT NULL,
    Pocition_final [INT] NOT NULL,
    CONSTRAINT pk_Stage PRIMARY KEY (Stage_id),
    --CONSTRAINT fk_Stage FOREIGN KEY (Pocition_start_id) REFERENCES Pocition_start(Pocition_start_id),
    --CONSTRAINT fk_Stage FOREIGN KEY (Pocition_final) REFERENCES Pocition_final(Pocition_final_id)

    -- specify more columns here
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Orientation', 'U') IS NOT NULL
DROP TABLE dbo.Orientation
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Orientation
(
    Orientation_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- primary key column
    NORTH [NVARCHAR](50) NOT NULL,
    SOUTH [NVARCHAR](50) NOT NULL,
    WEST [NVARCHAR](50) NOT NULL,
    EAST [NVARCHAR](50) NOT NULL,
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
    Work_id INT NOT NULL IDENTITY(1,1), -- primary key column
    Descriptions [NVARCHAR](50) NOT NULL,
    Priority [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_WORK PRIMARY KEY (Work_id)

    -- specify more columns here
);
GO


-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Robot', 'U') IS NOT NULL
DROP TABLE dbo.Robot
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Robot
(
    Robot_id INT NOT NULL IDENTITY(1,1), -- primary key column
    Work_id [INT] NOT NULL,
    Stage_id [INT] NOT NULL,
    Orientation_id [INT] NOT NULL,
    States [INT] NOT NULL,
    Coordinate_X [INT] NOT NULL,
    Coordinate_Y [INT] NOT NULL,
    CONSTRAINT pk_Robot PRIMARY KEY (Robot_id),
    --CONSTRAINT fk_Robot FOREIGN KEY (Work_id) REFERENCES otraMAMADA(Work_id),
    --CONSTRAINT fk_Robot FOREIGN KEY (Stage_id) REFERENCES otraMAMADA(Stage_id),
    --CONSTRAINT fk_Robot FOREIGN KEY (Orientation_id) REFERENCES otraMAMADA(Orientation_id)
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
    SensorVisual_id INT NOT NULL IDENTITY(1,1), -- primary key column
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
    SensorProximity_id INT NOT NULL IDENTITY(1,1), -- primary key column
    Minimal_distance [NVARCHAR](50) NOT NULL,
    CONSTRAINT pk_SensorProximity PRIMARY KEY (SensorProximity_id)
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
    Sensor_id INT NOT NULL IDENTITY(1,1),
    SensorVisual_id [INT] NOT NULL,
    SensorProximity_id [INT] NOT NULL,
    CONSTRAINT pk_Sensor PRIMARY KEY (Sensor_id),
    --CONSTRAINT fk_Sensor FOREIGN KEY (SensorVisual_id) REFERENCES otraMAMADA(SensorVisual_id),
    --CONSTRAINT fk_Sensor FOREIGN KEY (SensorProximity_id) REFERENCES otraMAMADA(SensorProximity_id)
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