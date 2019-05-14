USE Hanks_Russo --Run this query first to prepare database with an SQL command

--Finding all Sedans
SELECT * 
FROM Vehicle 
WHERE BodyType='Sedan';

--Find all Sedans that are not Hyundai vehicles
SELECT *
FROM VEHICLE
WHERE BodyType='Sedan'
AND MAKE != 'Hyundai';

--Finding all the customers that worked with Benjamin Gonzales
SELECT * 
FROM Customer 
WHERE AgentID = '89324037';

--First and Last Name of every Customer that worked with Alex Smith
SELECT CustFirstName, CustLastName 
FROM Customer 
WHERE AgentID = '85693248';

--Find a list of available vehicles regardless of location
SELECT Make, Model, ModelYear, Price 
FROM Vehicle 
ORDER BY Price;

--Find a list of every car manufacturer
SELECT DISTINCT Make 
FROM Vehicle;

--Return the first and last name of every customer involved in a deal
SELECT Customer.CustFirstName, Customer.CustLastName 
FROM Customer, Deal 
WHERE Customer.CustomerID = Deal.CustomerID;

--Find the last name of all agents, and where they work, with a salary higher than 50000
SELECT AgentLastName, DealershipName 
FROM Sales_Agent, Dealership 
WHERE AgentSalary > 50000.00 
AND Sales_Agent.DealershipID = Dealership.DealershipID;

--Find all the deals that included Liability insurance
SELECT DealID FROM Insurance, Deal
WHERE Deal.InsuranceID = Insurance.InsuranceID
AND Insurance.PolicyType = 'Liability';

--Find all the dates that Alex Smith facilitated a deal
SELECT DealDate FROM Deal, Sales_Agent
WHERE Sales_Agent.AgentID = Deal.AgentID
AND AgentLastName = 'Smith' AND AgentFirstName = 'Alex';

--List the make and model of every vehicle sold
SELECT Make, Model 
FROM Vehicle, Deal
WHERE Vehicle.VehicleID = Deal.VehicleID;

--Find the DealID, the customer's last name, the car they bought, and how much they paid for it
SELECT Vehicle.Make, Vehicle.Model, Vehicle.Price, Customer.CustLastName, Deal.DealID
FROM Vehicle, Customer, Deal
WHERE Deal.VehicleID = Vehicle.VehicleID
AND Deal.CustomerID = Customer.CustomerID
ORDER BY Vehicle.Price;

--View what kind of insurance is on Connor Kirk's Toyota Sequoia
SELECT PolicyType
FROM Insurance, Customer, Deal
WHERE Insurance.InsuranceID = Deal.InsuranceID
AND Customer.CustomerID = Deal.CustomerID
AND Customer.CustLastName = 'Kirk' AND Customer.CustFirstName = 'Connor';

--See all the cars that have Liability insurance on them
SELECT Vehicle.Make, Vehicle.Model
FROM Vehicle, Deal, Insurance
WHERE Insurance.PolicyType = 'Liability'
AND Insurance.InsuranceID = Deal.InsuranceID
AND Vehicle.VehicleID = Deal.VehicleID;

--See the pay of each manager
SELECT MngrFirstName, MngrLastName, MngrSalary, MngrBonus
FROM Manager
ORDER BY MngrSalary;

--Query to establish data needed for redundancy file
SELECT *
FROM Vehicle, Distributor, Region, Dealership, Sales_Agent, Customer, Insurance, Deal, Manager --all tables
WHERE Vehicle.DistributorID = Distributor.DistributorID --matching keys
AND Region.RegionID = Dealership.RegionID
AND Dealership.DistributorID = Distributor.DistributorID
AND Deal.VehicleID = Vehicle.VehicleID
AND Deal.AgentID = Sales_Agent.AgentID
AND Insurance.InsuranceID = Deal.InsuranceID
AND Sales_Agent.ManagerID = Manager.ManagerID;

--Query practice, wasn't part of the final project
SELECT *
FROM Manager
WHERE EXISTS (SELECT MngrBonus FROM Manager);

SELECT COUNT(DealershipName)
FROM Dealership;

SELECT AVG(Price)
FROM Vehicle;

SELECT VehicleID, Price, Count(*)
FROM Vehicle
WHERE Price >= 10000
GROUP BY VehicleID, Price
ORDER BY Price;

SELECT Make, SUM(Price)
FROM Vehicle
GROUP BY Make
HAVING SUM(Price) > 30000;

SELECT * FROM Vehicle
WHERE Model LIKE '%S%';