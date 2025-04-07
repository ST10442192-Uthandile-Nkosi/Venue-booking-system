-- DATABASE CREATION SECTION 
use master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BookingSystemDB')
DROP DATABASE BookingSystemDB
CREATE DATABASE BookingSystemDB
USE BookingSystemDB

-- TABALE CREATION SECTION
CREATE TABLE Venue(
    VenueID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    VenueName VARCHAR(250) NOT NULL,
    VenueLocation VARCHAR(250) NOT NULL,
    Capacity INT,
    ImageURL VARCHAR(MAX)
);

CREATE TABLE Event(
    EventID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    VenueID INT FOREIGN KEY REFERENCES Venue(VenueID) NOT NULL,
    EventName VARCHAR(250) NOT NULL,
    EventDate DATE NOT NULL,
    Description VARCHAR(500) NOT NULL,
);

CREATE TABLE Booking(
    BookingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventID INT FOREIGN KEY REFERENCES Event(EventID) NOT NULL,
    VenueID INT FOREIGN KEY REFERENCES Venue(VenueID) NOT NULL,
    BookingDate DATE NOT NULL,
);

-- TABLE INSERTION SECTION
INSERT INTO Venue(VenueName, VenueLocation, Capacity, ImageURL) VALUES 
('Skyline Rooftop','177 Love Street',150,'https://media.istockphoto.com/id/1184628725/photo/3d-wedding-reception-background-illustration.jpg?s=612x612&w=0&k=20&c=XpFfBNDKM99vaK0N0QkvkvDFNRWIRmJNTkP6qDJbSI8='),
('The Terrace Hotel', '23 Alvetica Street',350, 'https://static.vecteezy.com/system/resources/thumbnails/037/112/027/small/ai-generated-whimsical-decor-vibrant-balloons-and-joyful-revelry-create-a-lively-and-enchanting-party-ambiance-free-photo.jpg'),
('Oceanview Conference Center', '7 Maple Road', 200, 'https://thecapital.co.za/wp-content/uploads/2022/07/The_Capital_On_The_Park_Conference_Overview_v2-1024x576-1.jpeg'),
('BSS Community Hall', '13 Quice Drive', 190, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv7lA75-NtWnvuUChF0-p09d8Djvehav7eqw&s');

INSERT INTO Event(VenueID, EventName, EventDate, Description) VALUES
(1,'Wedding Gala', '2025-06-11', 'Private wedding reception.'),
(2,'A Night of Elegance', '2025-04-23', 'Black tie event with keynote speakers.'),
(3,'Pitch Night', '2025-05-02', 'New entrepreneures pitching their business ideas.'),
(4,'2025 Mega Tech Expo', '2025-04-11', 'Technology exposition');

INSERT INTO Booking(EventID, VenueID, BookingDate) VALUES
(1, 1, '2025-06-11'),
(3, 2, '2025-05-02');


-- TABLE ALTERATION SECTION 


-- TABLE MANIPUTLATION SECTION
SELECT * FROM Venue WHERE VenueName = 'Wedding Venue';
SELECT * FROM Event
SELECT * FROM Booking