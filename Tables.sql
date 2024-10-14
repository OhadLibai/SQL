
/* Creating tables for the database */

create table Store(
    storeID int,
    storeName varchar(255),
    address varchar(255),
    storeSize int,
    PRIMARY KEY (storeID)
);

create table Toy(
    toyID int,
    toyName varchar(255),
    minAge int,
    maxAge int,
    PRIMARY KEY (toyID)
);

create table ToyStoreSelling(
    storeID int,
    toyID int,
    currPrice float,
    inStock TinyInt,
    deliverable TinyInt,
    PRIMARY KEY (storeID, toyID)
);

create table Expenses(
    storeID int,
    rent int,
    rates int,
    employees int,
    PRIMARY KEY (storeID)
);

create table Revenues(
    storeID int,
    toyID int,
    price float,
    quantity int,
    PRIMARY KEY (storeID, toyID)
);

create table ToyNetworkInfo(
    toyID int,
    reserve int,
    minPrice float,
    maxPrice float,
    PRIMARY KEY (toyID)
);

create table Supply(
    toyID int,
    supplierName varchar(255),
    supplierPrice float,
    FOREIGN KEY (toyID)
    REFERENCES Toy (toyID) 
);


/* Populating the tables */

/* Populate Store */
INSERT INTO Store VALUES ('1', 'FunToy', 'add1', '100'); 
INSERT INTO Store VALUES ('2', 'GraceToy', 'add2', '150');
INSERT INTO Store VALUES ('3', 'JoyToy', 'add3', '250');
INSERT INTO Store VALUES ('4', 'GameToy', 'add4', '170');
INSERT INTO Store VALUES ('5', 'GingleToy', 'add5', '300');

/* Populate Toy */
INSERT INTO Toy VALUES ('1', 'toy1', 1, 8);
INSERT INTO Toy VALUES ('2', 'toy2', 2, 10);
INSERT INTO Toy VALUES ('3', 'toy3', 3, 12);
INSERT INTO Toy VALUES ('4', 'toy4', 1, 5);
INSERT INTO Toy VALUES ('5', 'toy5', 2, 6);
INSERT INTO Toy VALUES ('6', 'toy6', 6, 20);
INSERT INTO Toy VALUES ('7', 'toy7', 8, 99);
INSERT INTO Toy VALUES ('8', 'toy8', 3, 6);
INSERT INTO Toy VALUES ('9', 'toy9', 3, 8);
INSERT INTO Toy VALUES ('10', 'toy10', 12, 99);
INSERT INTO Toy VALUES ('11', 'toy11', 14, 99);
INSERT INTO Toy VALUES ('12', 'toy12', 6, 18);

/* Populate ToyStoreSelling */
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '1', '12.9', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '4', '11.4', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '2', '16.8', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2','8', '45', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '9', '80', '0', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '5', '15', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '4', '14', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '6', '90', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '2', '43.5', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '3', '52.6', '0', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('4', '2', '40', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '8', '22', '0', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('4', '9', '58', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '11', '19', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '12', '47', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '7', '23', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '12', '8', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '10', '47', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '5', '52', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '3', '30', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '4', '16.9', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '3', '16.9', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '9', '14.3', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '9', '17', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '7', '11.3', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('4', '10', '11.5', '1','1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('4', '1', '19.6', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '2', '18', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('3', '8', '15', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '7', '15.5', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('1', '12', '26.4', '1', '0');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('2', '11', '29.3', '0', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('5', '6', '36.9', '1', '1');
INSERT INTO `toynetwork`.`toystoreselling` (`storeID`, `toyID`, `currPrice`, `inStock`, `deliverable`) VALUES ('4', '12', '17', '1', '1');

/* Populate Expenses */
INSERT INTO `toynetwork`.`expenses` (`storeID`, `rent`, `rates`, `employees`) VALUES ('1', '2000', '220', '2200');
INSERT INTO `toynetwork`.`expenses` (`storeID`, `rent`, `rates`, `employees`) VALUES ('2', '3000', '360', '2500');
INSERT INTO `toynetwork`.`expenses` (`storeID`, `rent`, `rates`, `employees`) VALUES ('3', '1000', '190', '750');
INSERT INTO `toynetwork`.`expenses` (`storeID`, `rent`, `rates`, `employees`) VALUES ('4', '500', '50', '450');
INSERT INTO `toynetwork`.`expenses` (`storeID`, `rent`, `rates`, `employees`) VALUES ('5', '2500', '150', '2000');

/* Populate Revenues */
UPDATE `toynetwork`.`revenues` SET `price` = '11.9', `quantity` = '45' WHERE (`storeID` = '1') and (`toyID` = '1');
UPDATE `toynetwork`.`revenues` SET `price` = '42.5', `quantity` = '80' WHERE (`storeID` = '1') and (`toyID` = '2');
UPDATE `toynetwork`.`revenues` SET `price` = '25', `quantity` = '150' WHERE (`storeID` = '1') and (`toyID` = '3');
UPDATE `toynetwork`.`revenues` SET `price` = '16', `quantity` = '43' WHERE (`storeID` = '1') and (`toyID` = '4');
UPDATE `toynetwork`.`revenues` SET `price` = '17', `quantity` = '78' WHERE (`storeID` = '1') and (`toyID` = '7');
UPDATE `toynetwork`.`revenues` SET `price` = '21.2', `quantity` = '99' WHERE (`storeID` = '1') and (`toyID` = '9');
UPDATE `toynetwork`.`revenues` SET `price` = '30', `quantity` = '33' WHERE (`storeID` = '1') and (`toyID` = '12');
UPDATE `toynetwork`.`revenues` SET `price` = '16.9', `quantity` = '59' WHERE (`storeID` = '2') and (`toyID` = '3');
UPDATE `toynetwork`.`revenues` SET `price` = '15.9', `quantity` = '156' WHERE (`storeID` = '2') and (`toyID` = '4');
UPDATE `toynetwork`.`revenues` SET `price` = '16.5', `quantity` = '147' WHERE (`storeID` = '2') and (`toyID` = '5');
UPDATE `toynetwork`.`revenues` SET `price` = '78', `quantity` = '120' WHERE (`storeID` = '2') and (`toyID` = '9');
UPDATE `toynetwork`.`revenues` SET `price` = '12.3', `quantity` = '140' WHERE (`storeID` = '3') and (`toyID` = '2');
UPDATE `toynetwork`.`revenues` SET `price` = '50.1', `quantity` = '153' WHERE (`storeID` = '3') and (`toyID` = '3');
UPDATE `toynetwork`.`revenues` SET `price` = '92', `quantity` = '187' WHERE (`storeID` = '3') and (`toyID` = '6');
UPDATE `toynetwork`.`revenues` SET `price` = '24', `quantity` = '50' WHERE (`storeID` = '3') and (`toyID` = '7');
UPDATE `toynetwork`.`revenues` SET `price` = '45', `quantity` = '29' WHERE (`storeID` = '3') and (`toyID` = '12');
UPDATE `toynetwork`.`revenues` SET `price` = '41.6', `quantity` = '96' WHERE (`storeID` = '4') and (`toyID` = '2');
UPDATE `toynetwork`.`revenues` SET `price` = '57', `quantity` = '94' WHERE (`storeID` = '4') and (`toyID` = '9');
UPDATE `toynetwork`.`revenues` SET `price` = '14.8', `quantity` = '120' WHERE (`storeID` = '4') and (`toyID` = '12');
UPDATE `toynetwork`.`revenues` SET `quantity` = '189' WHERE (`storeID` = '2') and (`toyID` = '8');
UPDATE `toynetwork`.`revenues` SET `quantity` = '12' WHERE (`storeID` = '2') and (`toyID` = '11');
UPDATE `toynetwork`.`revenues` SET `quantity` = '17' WHERE (`storeID` = '2') and (`toyID` = '12');
UPDATE `toynetwork`.`revenues` SET `quantity` = '189' WHERE (`storeID` = '3') and (`toyID` = '4');
UPDATE `toynetwork`.`revenues` SET `quantity` = '20' WHERE (`storeID` = '3') and (`toyID` = '8');
UPDATE `toynetwork`.`revenues` SET `quantity` = '25' WHERE (`storeID` = '3') and (`toyID` = '9');
UPDATE `toynetwork`.`revenues` SET `quantity` = '78' WHERE (`storeID` = '4') and (`toyID` = '1');
UPDATE `toynetwork`.`revenues` SET `quantity` = '35' WHERE (`storeID` = '4') and (`toyID` = '10');
UPDATE `toynetwork`.`revenues` SET `quantity` = '73' WHERE (`storeID` = '5') and (`toyID` = '2');
UPDATE `toynetwork`.`revenues` SET `quantity` = '91' WHERE (`storeID` = '5') and (`toyID` = '5');
UPDATE `toynetwork`.`revenues` SET `quantity` = '97' WHERE (`storeID` = '5') and (`toyID` = '6');
UPDATE `toynetwork`.`revenues` SET `quantity` = '156' WHERE (`storeID` = '5') and (`toyID` = '7');
UPDATE `toynetwork`.`revenues` SET `quantity` = '137' WHERE (`storeID` = '5') and (`toyID` = '8');
UPDATE `toynetwork`.`revenues` SET `quantity` = '182' WHERE (`storeID` = '5') and (`toyID` = '10');
UPDATE `toynetwork`.`revenues` SET `quantity` = '66' WHERE (`storeID` = '5') and (`toyID` = '11');

/* Populate ToyNetworkInfo */
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('1', '100', '11', '20');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('2', '300', '18', '45');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('3', '250', '16', '55');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('4', '50', '10', '15');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('5', '80', '15', '35');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('6', '90', '35', '70');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('7', '220', '15', '25');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('8', '450', '20', '50');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('9', '300', '17', '60');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('10', '140', '11', '22');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('11', '70', '19', '30');
INSERT INTO `toynetwork`.`toynetworkinfo` (`toyID`, `reserve`, `minPrice`, `maxPrice`) VALUES ('12', '25', '14', '30');

/* Populate Supply */
insert into supply values(1,'BringerToy',8);
insert into supply values(1,'SuppToy',9);

insert into supply values(2,'CellToy',14);
insert into supply values(2,'BringerToy',15);

insert into supply values(3,'BringerToy',9);
insert into supply values(3,'CellToy',11);

insert into supply values(4,'CellToy',7.5);
insert into supply values(4,'SuppToy',9.5);

insert into supply values(5,'SuppToy',12.5);
insert into supply values(5,'CellToy',13.5);

insert into supply values(6,'SuppToy',26);
insert into supply values(6,'BringerToy',28);

insert into supply values(7,'BringerToy',11);
insert into supply values(7,'SuppToy',12.5);

insert into supply values(8,'BringerToy',19);
insert into supply values(8,'CellToy',22);

insert into supply values(9,'CellToy',15.5);
insert into supply values(9,'SuppToy',19.5);

insert into supply values(10,'CellToy',6.5);
insert into supply values(10,'SuppToy',9.5);

insert into supply values(11,'SuppToy',16.5);
insert into supply values(11,'BringerToy',19);

insert into supply values(12,'BringerToy',13);
insert into supply values(12,'SuppToy',16);
