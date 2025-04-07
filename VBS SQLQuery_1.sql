use master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'SMSPart1')
DROP DATABASE SMSPart1
CREATE DATABASE SMSPart1
USE SMSPart1

CREATE TABLE Venue(
    VenueID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    VenueName VARCHAR(250) NOT NULL,
    VenueLocation VARCHAR(250) NOT NULL,
    Capacity INT,
    ImageURL VARCHAR(MAX)
);










