CREATE DATABASE Opticsdb;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    City NVARCHAR(100),
    PhoneNumber INT
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PrescriptionDate DATE NOT NULL,
    OD_Sphere DECIMAL(5, 2) NOT NULL,
    OD_Cylinder DECIMAL(4, 2),
    OD_Axis INT,
    OS_Sphere DECIMAL(4, 2) NOT NULL,
    OS_Cylinder DECIMAL(4, 2),
    OS_Axis INT,
    OU_Addition DECIMAL(3, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ExamDate DATE NOT NULL,
    EyePressure DECIMAL(5, 2),
    OD_FarVisualAcuity VARCHAR(20),
    OS_FarVisualAcuity VARCHAR(20),
    OU_FarVisualAcuity VARCHAR(20),
    OU_NearVisualAcuity VARCHAR(20),
    FarCoverTest VARCHAR(20),
    NearCoverTest VARCHAR(20),
    Worth INT,
    Wilms DECIMAL(4, 2),
    PrescriptionID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID)
);

CREATE TABLE FrameTypes (
    TypeID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE FrameShapes (
    ShapeID INT PRIMARY KEY,
    Name VARCHAR(15) UNIQUE
);

CREATE TABLE FrameCollections (
    CollectionID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE FrameMaterials (
    MaterialID INT PRIMARY KEY,
    Name VARCHAR(15) UNIQUE
);

CREATE TABLE FrameBrands (
    BrandID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Frames (
    FrameID INT PRIMARY KEY,
    Model VARCHAR(100) NOT NULL UNIQUE,
    BrandID INT,
    TypeID INT, 
    ShapeID INT,
    CollectionID  INT,
    Price DECIMAL(10, 2) CHECK (Price>0),
    MaterialID INT,
    FOREIGN KEY (BrandID) REFERENCES FrameBrands(BrandID),
    FOREIGN KEY (TypeID) REFERENCES FrameTypes(TypeID),
    FOREIGN KEY (ShapeID) REFERENCES FrameShapes(ShapeID),
    FOREIGN KEY (CollectionID) REFERENCES FrameCollections(CollectionID),
    FOREIGN KEY (MaterialID) REFERENCES FrameMaterials(MaterialID)  
);

CREATE TABLE LensTypes (
    TypeID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE LensMaterials (
    MaterialID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE LensCoatings(
    CoatingID INT PRIMARY KEY,
    Name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE LensConstructions (
    ConstructionID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Lenses (
    LensID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL UNIQUE,
    TypeID INT,
    MaterialID INT,
    CoatingID INT,
    ConstructionID INT,
    Price DECIMAL(10, 2) CHECK (Price>0),
    FOREIGN KEY (TypeID) REFERENCES LensTypes(TypeId),
    FOREIGN KEY (MaterialID) REFERENCES LensMaterials(MaterialID),
    FOREIGN KEY (CoatinglID) REFERENCES LensCoatings(CoatingID),
    FOREIGN KEY (ConstructionID) REFERENCES LensConstructions(ConstructionID),
);



    
CREATE TABLE PaymentForms (
    PaymentFormID INT PRIMARY KEY,
    Name VARCHAR(20),
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FrameID INT,
    LensID INT,
    PrescriptionID INT,
    TotalAmount DECIMAL(7,2),
    PaymentFormID INT,
    FOREIGN KEY(FrameID) REFERENCES Frames(FrameID),
    FOREIGN KEY(LensID) REFERENCES Lenses(LensID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
    FOREIGN KEY(PaymentForm) REFERENCES PaymentForms(PaymentFormID),
);
