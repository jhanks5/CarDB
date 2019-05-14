CREATE DATABASE Hanks_Russo
USE Hanks_Russo

CREATE TABLE Region
(	RegionID	CHAR(3)			NOT NULL,
	RegionZIP	CHAR(5)			NOT NULL,
	RegionName	VARCHAR(15)		NOT NULL,
	PRIMARY KEY (RegionID, RegionZIP) );

CREATE TABLE Distributor
(	DistributorID	CHAR(8)		NOT NULL,
	DistributorName	VARCHAR(15) NOT NULL,
	PRIMARY KEY (DistributorID) );

CREATE TABLE Dealership
(	DealershipID	CHAR(5)		NOT NULL,
	DistributorID	CHAR(8)		NOT NULL,
	RegionID		CHAR(3)		NOT NULL,
	RegionZIP		CHAR(5)		NOT NULL,
	DealershipName	VARCHAR(15)	NOT NULL,
	PRIMARY KEY	(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID),
	FOREIGN KEY (RegionID, RegionZIP) REFERENCES Region(RegionID, RegionZIP) );

CREATE TABLE Vehicle
(	VehicleID		CHAR(3)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	DistributorID	CHAR(8)			NOT NULL,
	Make			VARCHAR(15)		NOT NULL,
	Model			VARCHAR(15)		NOT NULL,
	BodyType		VARCHAR(15)		NOT NULL,
	ModelYear		INT				NOT NULL,
	Price			NUMERIC(8,2)	NOT NULL,
	PRIMARY KEY (VehicleID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID) );

CREATE TABLE Manager
(	ManagerID		CHAR(8)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	DistributorID	CHAR(8)			NOT NULL,
	MngrFirstName	VARCHAR(15)		NOT NULL,
	MngrLastName	VARCHAR(15)		NOT NULL,
	MngrSalary		NUMERIC(8,2)	NOT NULL,
	MngrBonus		NUMERIC(8,2)
	PRIMARY KEY (ManagerID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID),
	FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID) );

CREATE TABLE Sales_Agent
(	AgentID			CHAR(8)			NOT NULL,
	ManagerID		CHAR(8)			NOT NULL,
	DealershipID	CHAR(5)			NOT NULL,
	AgentFirstName	VARCHAR(15)		NOT NULL,
	AgentLastName	VARCHAR(15)		NOT NULL,
	AgentSalary		NUMERIC(8,2)	NOT NULL,
	PRIMARY KEY (AgentID),
	FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID),
	FOREIGN KEY (DealershipID) REFERENCES Dealership(DealershipID) );

CREATE TABLE Customer
(	CustomerID		CHAR(8)			NOT NULL,
	AgentID			CHAR(8)			NOT NULL,
	CustFirstName	VARCHAR(15)		NOT NULL,
	CustLastName	VARCHAR(15)		NOT NULL,
	PhoneNumber		VARCHAR(12)		NOT NULL,
	Email			NVARCHAR(25)	NOT NULL, --N for unicode symbols
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (AgentID) REFERENCES Sales_Agent(AgentID) );

CREATE TABLE Insurance
(	InsuranceID CHAR(5)			NOT NULL,
	PolicyType	VARCHAR(15)		NOT NULL,
	RenewalDate	DATE			NOT NULL,
	PRIMARY KEY (InsuranceID) );

CREATE TABLE Deal
(	DealID			CHAR(5)		NOT NULL,
	VehicleID		CHAR(3)		NOT NULL,
	AgentID			CHAR(8)		NOT NULL,
	CustomerID		CHAR(8)		NOT NULL,
	InsuranceID		CHAR(5),
	DealDate		DATE		NOT NULL,
	PRIMARY KEY (DealID),
	FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
	FOREIGN KEY (AgentID) REFERENCES Sales_Agent(AgentID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID) );