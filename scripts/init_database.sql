/*==============================
  Create Database and Schemas
==============================

SCRIPT PURPOSE: This script resets and initializes a DataWarehouse database. It first checks if the database already exists and, if so, removes it by disconnecting
all users and rolling back active transactions. It then creates a fresh DataWarehouse database and sets up three schemas, _bronze, _silver, and _gold, to
support a layered data architecture for data ingestion, transformation, and reporting.

WARNING: This script will permanently delete the existing DataWarehouse database if it exists. All data within the database will be lost and cannot be
recovered. The script also forces all active connections to close and rolls back any ongoing transactions. Ensure that important data is backed up and that
no critical processes are using the database before executing this script.

*/

use master;
go

--check the existence of the database and drop if exists

if exists (select 1 from sys.databases where name='DataWarehouse')
begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse
end;
go

--create database

create database DataWarehouse;
go

use DataWarehouse;
go

--create schemas

create schema _bronze;
go
create schema _silver;
go
create schema _gold;
go
