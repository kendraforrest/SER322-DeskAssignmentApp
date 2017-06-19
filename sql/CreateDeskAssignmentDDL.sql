CREATE SCHEMA `SER322_FP`;
 
CREATE TABLE `SER322_FP`.`Person` (
  `EmpID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Level` INT NOT NULL,
  `TeamID` INT NOT NULL,
  PRIMARY KEY (`EmpID`),
  FOREIGN KEY (TeamID) REFERENCES `Team`(`TeamID`));
 
CREATE TABLE `SER322_FP`.`Location` (
  `DeskID` VARCHAR(45) NOT NULL,
  `Building` VARCHAR(45) NOT NULL,
  `Floor` INT NOT NULL,
  `Section` INT NOT NULL,
  `Aisle` VARCHAR(45) NOT NULL,
  `Desk` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeskID`));
 
CREATE TABLE `SER322_FP`.`Team` (
  `TeamID` INT NOT NULL,
  `Size` INT NOT NULL,
  `CostCenter` INT NOT NULL,
  `TeamName` VARCHAR(45) NOT NULL,
  `TeamParent` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TeamID`));
  
CREATE TABLE `SER322_FP`.`DeskAssignment` (
	`EmpID` INT NOT NULL,
    `DeskID` VARCHAR(45) NOT NULL,
    `StartDate` DATE,
    `EndDate` DATE,
    CONSTRAINT `PK_DeskAssignment` PRIMARY KEY (`EmpID`, `DeskID`),
    FOREIGN KEY (`EmpID`) REFERENCES `Person`(`EmpID`),
    FOREIGN KEY (`DeskID`) REFERENCES `Location`(`DeskID`));

-- Create app user and grant table permissions
CREATE USER 'deskassign_app'@'%' IDENTIFIED BY 'DeskAssign!4me';

GRANT SELECT, INSERT, UPDATE, DELETE ON `SER322_FP`.`Person` TO 'deskassign_app'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `SER322_FP`.`Team` TO 'deskassign_app'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `SER322_FP`.`DeskAssignment` TO 'deskassign_app'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `SER322_FP`.`Location` TO 'deskassign_app'@'%';