USE Hanks_Russo
---Database keeps track of multiple car dealerships, their staff, customers, and inventory

--RegionID, RegionZIP, RegionName
INSERT INTO Region VALUES ('334', '36081', 'Troy');
INSERT INTO Region VALUES ('356', '36079', 'Montgomery');
INSERT INTO Region VALUES ('578', '58203', 'Auburn');

--DistributorID, DistributorName
INSERT INTO Distributor VALUES ('25863217', 'Ford');
INSERT INTO Distributor VALUES ('36521789', 'Hyundai');
INSERT INTO Distributor VALUES ('12347896', 'Honda');
INSERT INTO Distributor VALUES ('45324895', 'GMC');
INSERT INTO Distributor VALUES ('36589217', 'Toyota');
INSERT INTO Distributor VALUES ('45632479', 'Nissan');

--DealershipID, DistributorID (FK), RegionID (FK), RegionZip (FK), DealershipName
INSERT INTO Dealership VALUES ('85632', '36521789', '356', '36079', 'Gump Hyundai');
INSERT INTO Dealership VALUES ('47823', '12347896', '334', '36081', 'Troy Honda');
INSERT INTO Dealership VALUES ('78962', '36589217', '334', '36081', 'Troy Toyota');
INSERT INTO Dealership VALUES ('59823', '45324895', '578', '58203', 'Auburn GMC');
INSERT INTO Dealership VALUES ('32569', '45632479', '578', '58203', 'Auburn Nissan');
INSERT INTO Dealership VALUES ('96523', '25863217', '356', '36079', 'Montgomery Ford');

--VehicleID, DealershipID (FK), DistributorID (FK), Make, Model, BodyType, ModelYear, Price
INSERT INTO Vehicle VALUES ('123', '85632','36521789', 'Hyundai', 'Sonata', 'Sedan', 2017, 17999.99); --Gump Hyundai
INSERT INTO Vehicle VALUES ('456', '47823', '12347896', 'Honda', 'Civic', 'Sedan', 2008, 6750.99); --Troy Honda
INSERT INTO Vehicle VALUES ('532', '59823', '45324895', 'GMC', 'Yukon', 'SUV', 2016, 33995.50); --Auburn GMC
INSERT INTO Vehicle VALUES ('328', '96523', '25863217', 'Ford', 'Explorer', 'SUV', 2015, 23900.00); --Montgomery Ford
INSERT INTO Vehicle VALUES ('486', '78962', '36589217', 'Toyota', 'Corolla', 'Sedan', 2017, 17897.35); --Troy Toyota
INSERT INTO Vehicle VALUES ('265', '32569', '45632479', 'Nissan', 'Titan', 'Pickup', 2018, 30410.55); --Auburn Nissan
INSERT INTO Vehicle VALUES ('554', '78962', '36589217', 'Toyota', 'Camry', 'Sedan', 2016, 19901.90); --Troy Toyota
INSERT INTO Vehicle VALUES ('416', '96523', '25863217', 'Ford', 'Escape SE', 'SUV', 2016, 15500.99); --Montgomery Ford
INSERT INTO Vehicle VALUES ('729', '59823', '45324895', 'GMC', 'Sierra 1500', 'Pickup', 2018, 32995.99); --Auburn GMC
INSERT INTO Vehicle VALUES ('349', '85632', '36521789', 'Hyundai', 'Elantra', 'Sedan', 2015, 11481.55); --Gump Hyundai
INSERT INTO Vehicle VALUES ('216', '47823', '12347896', 'Honda', 'Pilot EXL', 'SUV', 2014, 15999.25); --Troy Honda
INSERT INTO Vehicle VALUES ('377', '78962', '36589217', 'Toyota', 'Sequoia', 'SUV', 2016, 32981.90); --Troy Toyota

--ManagerID, DealershipID (FK), DistributorID (FK), MngrFirstName, MngrLastName, MngrSalary, MngrBonus(O)
INSERT INTO Manager VALUES ('12345678', '59823', '45324895', 'John', 'Boling', 87900.00, 5100.23); --Manager for Auburn GMC
INSERT INTO Manager VALUES ('45896324', '32569', '45632479', 'Sally', 'Mae', 75000.99, 4250.50); --Manager for Auburn Nissan
INSERT INTO Manager VALUES ('52689974', '85632', '36521789', 'Lamar', 'Jackson', 91250.10, NULL); --Manager for Gump Hyundai, no bonus
INSERT INTO Manager VALUES ('14458973', '96523', '25863217', 'Henry', 'Miller', 79025.99, 5200.60); --Manager for Montgomery Ford
INSERT INTO Manager VALUES ('32556978', '78962', '36589217', 'Rachel', 'Smith', 81500.10, 2400.00); --Manager for Troy Toyota
INSERT INTO Manager VALUES ('58894123', '47823', '12347896', 'Kevin', 'Rogers', 71250.00, 8450.00); --Manager for Troy Honda

--AgentID, ManagerID (FK), DealershipID (FK), AgentFirstName, AgentLastName, AgentSalary
INSERT INTO Sales_Agent VALUES ('85693248', '12345678', '59823', 'Alex', 'Smith', 47520.59); --Works at Auburn GMC
INSERT INTO Sales_Agent VALUES ('79621463', '45896324', '32569', 'Hubert', 'Davis', 52081.32); --Works at Auburn Nissan
INSERT INTO Sales_Agent VALUES ('85264532', '58894123', '47823', 'Paul', 'Werner', 51850.50); --Works for Troy Honda
INSERT INTO Sales_Agent VALUES ('45698234', '12345678', '59823', 'Jordan', 'Myers', 43450.00); --Works at Auburn GMC
INSERT INTO Sales_Agent VALUES ('89324037', '45896324', '32569', 'Benjamin', 'Gonzales', 49250.90); --Works at Auburn Nissan
INSERT INTO Sales_Agent VALUES ('74125852', '58894123', '47823', 'Allison', 'Garner', 54800.00); --Works for Troy Honda
INSERT INTO Sales_Agent VALUES ('32433468', '52689974', '85632', 'Jennifer', 'Martin', 57950.99); --Works for Gump Hyundai
INSERT INTO Sales_Agent VALUES ('78932145', '14458973', '96523', 'Jasper', 'Sparks', 48650.99); --Works for Montgomery Ford
INSERT INTO Sales_Agent VALUES ('85476932', '14458973', '96523', 'Mitchell', 'Fields', 42600.00); --Works for Montgomery Ford
INSERT INTO Sales_Agent VALUES ('45879632', '32556978', '78962', 'Stacy', 'Diaz', 47600.50); --Works for Troy Toyota
INSERT INTO Sales_Agent VALUES ('54279634', '32556978', '78962', 'Marshall', 'Reese', 57180.00); --Works for Troy Toyota
INSERT INTO Sales_Agent VALUES ('28547962', '52689974', '85632', 'Jack', 'Hublot', 61258.00); --Works for Gump Hyundai


--CustomerID, AgentID (FK), CustFirstName, CustLastName, PhoneNumber, Email
INSERT INTO Customer VALUES ('53247962', '85693248', 'Shelly', 'Jones', '4568423698', 'shellyjones@gmail.com'); --Worked with Alex Smith
INSERT INTO Customer VALUES ('64786233', '89324037', 'Logan', 'Hutchinson', '3345896789', 'loganhutch@yahoo.com'); --Worked with Benjamin Gonzales
INSERT INTO Customer VALUES ('24863197', '89324037', 'Mark', 'Hunt', '3347852143', 'markymark@gmail.com'); --Worked with Benjamin Gonzales
INSERT INTO Customer VALUES ('45682178', '85264532', 'John', 'Miller', '3568421479', 'johnboy@hotmail.com'); --Worked with Paul Werner
INSERT INTO Customer VALUES ('86321478', '85476932', 'Bill', 'Clark', '7892256541', 'bclrk@hotmail.com'); --Worked with Mitchell Fields
INSERT INTO Customer VALUES ('25463157', '85476932', 'Carly', 'Myers', '7897896325', 'carlyy478@gmail.com'); --Worked with Mitchell Fields
INSERT INTO Customer VALUES ('78962583', '85693248', 'Morgan', 'Stanley', '4562314862', 'morgstan78@yahoo.com'); --Worked with Alex Smith
INSERT INTO Customer VALUES ('74859612', '45879632', 'Barbara', 'Brown', '3348529654', 'bigbarb400@hotmail.com'); --Worked with Stacy Diaz
INSERT INTO Customer VALUES ('63222478', '45879632', 'Connor', 'Kirk', '3346953214', 'kirkkconnor@yahoo.com'); --Worked with Stacy Diaz
INSERT INTO Customer VALUES ('46525896', '32433468', 'Madison', 'Hart', '7892553001', 'lilmaddy@gmail.com'); --Worked with Jennifer Martin
INSERT INTO Customer VALUES ('88895214', '74125852', 'William', 'Martin', '6502287512', 'willmart@gmail.com');--Worked with Allison Garner
INSERT INTO Customer VALUES ('52147932', '78932145', 'Megan', 'Sellers', '3345893321', 'megmeg@hotmail.com'); --Worked with Jasper Sparks
INSERT INTO Customer VALUES ('78527962', '54279634', 'Andrew', 'Jackson', '3345301438', 'andyjack@gmail.com'); --Worked with Marshall Reese

--InsuranceID, PolicyType, RenewalDate
INSERT INTO Insurance VALUES ('26687', 'Liability', '2019-04-24');
INSERT INTO Insurance VALUES ('78222', 'Full Coverage', '2019-03-27');
INSERT INTO Insurance VALUES ('56482', 'Full Coverage', '2019-01-17');
INSERT INTO Insurance VALUES ('22268', 'Liability', '2019-02-11');
INSERT INTO Insurance VALUES ('11478', 'Full Coverage', '2019-04-01');
INSERT INTO Insurance VALUES ('44589', 'Full Coverage', '2020-02-01');
INSERT INTO Insurance VALUES ('21444', 'Full Coverage', '2020-04-18');

--DealID, VehicleID (FK), AgentID (FK), CustomerID (FK), InsuranceID (FK), DealDate
INSERT INTO Deal VALUES ('48876', '729', '85693248','53247962', NULL, '2019-04-16'); --Shelly Jones bought the GMC Sierra 1500 from Alex Smith, no insurance
INSERT INTO Deal VALUES ('21115', '123', '32433468', '46525896', '78222', '2018-03-27'); --Madison Hart bought the Hyundai Sonata from Jennifer Martin, with full coverage
INSERT INTO Deal VALUES ('33658', '216', '74125852', '88895214', '26687', '2018-04-24'); --William Martin bought the Honda Pilot EXL from Allison Garner, liability insurance
INSERT INTO Deal VALUES ('77885', '416', '85476932', '86321478', NULL, '2019-02-21'); --Bill Clark bought the Ford Escape from Mitchell Fields, no insurance
INSERT INTO Deal VALUES ('95632', '265', '89324037', '24863197', '56482', '2018-01-17'); --Mark Hunt bought the Nissan Titan from Benjamin Gonzales, with full coverage
INSERT INTO Deal VALUES ('58221', '456', '85264532', '45682178', '22268', '2018-02-11' ); --Paul Werner bought the Honda Civic from Paul Werner, liability insurance
INSERT INTO Deal VALUES ('45523', '377', '45879632', '63222478', '11478', '2018-04-01'); --Connor Kirk bought the Toyota Sequoia from Stacy Diaz, full coverage
INSERT INTO Deal VALUES ('48624', '486', '54279634', '78527962', NULL, '2018-11-08'); --Andrew Jackson bought the Toyota Corolla from Marshall Reese, no insurance
INSERT INTO Deal VALUES ('55896', '554', '45879632', '74859612', '44589', '2019-02-01'); --Barbara Brown bought the Toyota Camry from Stacy Diaz, with full coverage
INSERT INTO Deal VALUES ('25839', '328', '78932145', '52147932', '21444', '2019-04-18'); --Megan Sellers bought the Ford Explorer from Jasper Sparks, with liability insurance