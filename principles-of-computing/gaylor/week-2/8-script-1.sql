-- Tutorial 1A
alter user C##17076749 identified by e1459dea5c replace C##17076749
-- PASSWORD 
-- e1459dea5c
-- Create table landlord
CREATE TABLE Landlord
(Landlord_Number 	CHAR(4) NOT NULL,
    Name 			CHAR(30) NOT NULL,
    Address		    CHAR(50),
    ContactNumber	CHAR(14),
    NoOfProperties	NUMBER,
    Constraint Landlord_Landlordno_Pk Primary Key(Landlord_Number));
-- Insert into landlord
INSERT INTO Landlord (Landlord_Number, Name, Address, ContactNumber, NoOfProperties)
VALUES('A001','R.Smith','44 New road Neath','01443 567345',4);
-- Select *
select * from landlord
-- add 4 more landlord
INSERT INTO Landlord (Landlord_Number, Name, Address, ContactNumber, NoOfProperties)
    VALUES('A002','L.Evans','Cardiff','01443 752415',8);
INSERT INTO Landlord (Landlord_Number, Name, Address, ContactNumber, NoOfProperties)
    VALUES('A003','P.Baber','Newport','01443 123456',6);
INSERT INTO Landlord (Landlord_Number, Name, Address, ContactNumber, NoOfProperties)
    VALUES('A004','R.Thomas','Cwmbran','01443 987654',4);
INSERT INTO Landlord (Landlord_Number, Name, Address, ContactNumber, NoOfProperties)
    VALUES('A005','L.Thomas','Cilfynydd','01443 753159',1);
-- Insert another tenant using the landlord number A001. What happens?
-- can't insert due to unique landlord_no (PK)

-- Create and populate a ‘Property’ table.
--The table could contain: 
--Property Code, Address, Rent, Landlord Number (to link properties to landlords)
CREATE TABLE Property(
    Property_Code   CHAR(4) NOT NULL,
    Address         CHAR(50),
    Rent	        NUMBER(8),
    Landlord_Number CHAR(4),
    Constraint Property_PropertyCode_Pk Primary Key(Property_Code),
    FOREIGN KEY (Landlord_Number) REFERENCES Landlord(Landlord_Number)
    );
--Enter at least 3 properties.
INSERT INTO Property (Property_Code, Address, Rent, Landlord_Number)
    VALUES('P001','Albion Court Cilfynydd',450,'A004');
INSERT INTO Property (Property_Code, Address, Rent, Landlord_Number)
    VALUES('P002','Pontypridd Campus',350,'A003');
INSERT INTO Property (Property_Code, Address, Rent, Landlord_Number)
    VALUES('P003','Cardiff Campus',600,'A005');
--Output the table contents.
--PROP ADDRESS                                                  RENT LAND
--P001 Albion Court Cilfynydd                                    450 A004
--P002 Pontypridd Campus                                         350 A003
--P003 Cardiff Campus                                            600 A005
--Check that you have correctly defined the primary key by attempting to input a duplicate key entry.
INSERT INTO Property (Property_Code, Address, Rent, Landlord_Number)
    VALUES('P003','Test Me, I Dare You',1000,'A001');
-- Error due to PK

--Create and populate a ‘Tenant’ table that 
--The table could contain: 
--Tenant number, Name, Address, Telephone Number,
CREATE TABLE Tenant(
    Tenant_Number       CHAR(4) NOT NULL,
    Name                CHAR(40),
    Address             CHAR(50),
    Telephone_Number    CHAR(15),
    Constraint Tenant_Number_Pk Primary Key(Tenant_Number)
    );
--Enter at least 3 tenants.
INSERT INTO Tenant (Tenant_Number, Name, Address, Telephone_Number)
    VALUES('T001','Sparko Smith', 'Newport','01631 873546');
INSERT INTO Tenant (Tenant_Number, Name, Address, Telephone_Number)
    VALUES('T002','Steve Burner', 'Cardiff','01631 873421');
INSERT INTO Tenant (Tenant_Number, Name, Address, Telephone_Number)
    VALUES('T003','Geoff Free', 'Cwmbran','01631 741741');
--Output the table contents.
--TENA    NAME            ADDRESS     TELEPHONE_NUMBE
--T001    Sparko Smith    Newport     01631 873546   
--T002    Steve Burner    Cardiff     01631 873421   
--T003    Geoff Free      Cwmbran     01631 741741   
--Check that you have correctly defined the primary key by attempting to input a duplicate key entry.
INSERT INTO Tenant (Tenant_Number, Name, Address, Telephone_Number)
    VALUES('T003','Test Me', 'New York','+441245741741');


--Create and populate the link table ‘Rental’
--Primary key would be PropertyCode and TenantNumber
--Foreign keys would be PropertyCode to link to Property
--TenantNumber to link to Tenant
--Perhaps we could add other attributes: ‘date rented’ and ‘length of lease’.
CREATE TABLE Rental(
    P_Code          CHAR(4) NOT NULL,
    T_Number        CHAR(4) NOT NULL,
    Property_Code   CHAR(4),
    Tenant_Number   CHAR(4),
    Date_Rented     DATE,
    Length_Of_Lease NUMBER(3),
    FOREIGN KEY (Property_Code) REFERENCES Property(Property_Code),
    FOREIGN KEY (Tenant_Number) REFERENCES Tenant(Tenant_Number),
    Constraint Rental_Pk PRIMARY KEY (P_Code, T_Number)
    );
-- Date was a bad idea.
INSERT INTO RENTAL (P_CODE, T_NUMBER, PROPERTY_CODE, TENANT_NUMBER, DATE_RENTED, LENGTH_OF_LEASE) 
    VALUES ('P001', 'T001', 'P001', 'T001', TO_DATE('2020-10-05 15:13:22', 'YYYY-MM-DD HH24:MI:SS'), '5')