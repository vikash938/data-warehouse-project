/*
===============================================================================
DATABASE INITIALIZATION & SCHEMA SETUP
===============================================================================
Purpose:
    Establishes the target environment by creating the 'DataWarehouse' 
    database. Initializes the foundational Medallion architecture schemas:
    - bronze (Raw ingestion layer)
    - silver (Cleansed & transformed layer)
    - gold   (Business-ready analytical layer)

⚠️ CAUTION / DESTRUCTIVE ACTION:
    Executing this script checks for an existing instance of 'DataWarehouse'. 
    If present, the existing database WILL BE DROPPED, permanently removing 
    all stored schemas, tables, and data. Ensure all critical assets are 
    backed up prior to execution.
===============================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
