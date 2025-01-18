CREATE TABLE CarModel (
    ModelID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Name VARCHAR(50)
);

CREATE TABLE Car (
    SerialNumber INT PRIMARY KEY,
    ModelID INT REFERENCES CarModel(ModelID),
    Color VARCHAR(30),
    DisplayedPrice DECIMAL(10, 2),
    Cost DECIMAL(10, 2)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(255)
);

CREATE TABLE Store (
    StoreID INT PRIMARY KEY,
    Location VARCHAR(255)
);

CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(255),
    FixedSalary DECIMAL(10, 2),
    StoreID INT REFERENCES Store(StoreID)
);



CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    CarSerialNumber INT REFERENCES Car(SerialNumber),
    SellerID INT REFERENCES Seller(SellerID),
    CustomerID INT REFERENCES Customer(CustomerID),
    PurchasePrice DECIMAL(10, 2),
    SaleDate DATE
);

CREATE TABLE Storage (
    CarSerialNumber INT REFERENCES Car(SerialNumber),
    StoreID INT REFERENCES Store(StoreID),
    ArrivalDate DATE,
    DepartureDate DATE,
    PRIMARY KEY (CarSerialNumber, StoreID, ArrivalDate)
);
