/*
=============================================================================
Stored Procedure : Load Bronnze Layer (Source -> Bronze)
=============================================================================

Script Purpose :
  This stored procedure loads data into the 'bronze' schema from the external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Used the 'BULK INSERT' command to laod data from CSV files to bronze tables.

Parameters:
  None
  This stored procedure does not accept any parameters or return any values
Usage Example :
  EXEC bronze.load_bronze;
=====================================================================================

*/
