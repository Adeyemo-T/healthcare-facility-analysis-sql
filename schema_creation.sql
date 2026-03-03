CREATE TABLE Hospital_Types(Types_ID INT IDENTITY(1,1)PRIMARY KEY,
							   Types_Name VARCHAR (90) NOT NULL UNIQUE)

CREATE TABLE Hospitals(Provider_ID INT PRIMARY KEY,
							   Hospital_Names VARCHAR (90) NOT NULL,
							   Address NVARCHAR (100),
							   City NVARCHAR (100), states NVARCHAR (100),
							   Zip_code INT,County_Name NVARCHAR (100),
							   Phone_Number NVARCHAR (20),
							   Types_ID INT FOREIGN KEY REFERENCES Hospital_Types(Types_ID),
							   Hospital_Ownership NVARCHAR (30),Emergency_Services NVARCHAR (20));

CREATE TABLE Hospital_Locations(Location_ID INT PRIMARY KEY,
							   Provider_ID INT FOREIGN KEY REFERENCES Hospitals(Provider_ID),
							   Latitude FLOAT,Longitude FLOAT,Beds INT,Trauma_Level NVARCHAR (20),
							   Total_Staffs INT,Website NVARCHAR(200));
