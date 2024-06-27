CREATE DATABASE IF NOT EXISTS SAS_db;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';

GRANT
  SELECT, UPDATE, INSERT
  ON SAS_db.* TO 'user'@'%';

USE SAS_db;

CREATE TABLE IF NOT EXISTS systems(
    ID INT NOT NULL AUTO_INCREMENT,
    sas_name VARCHAR(100) NOT NULL,
    vendor_name VARCHAR(100) NOT NULL,
    supported_os VARCHAR(100) NOT NULL,
    rating FLOAT NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO systems(
    sas_name,
    vendor_name,
    supported_os,
    rating
)
VALUES(
    'SICAM SCC',
    'Siemens',
    'Windows',
    8.3
),(
    'DS Agile',
    'GE',
    'Windows',
    7.1
),(
    'MicroSCADA',
    'ABB/Hitachi',
    'Windows',
    6.3
),(
    'MasterScada',
    'MPS-Soft',
    'Windows/Linux',
    7.6
);