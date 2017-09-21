CREATE TABLE Planet
(
  PlanetID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  PRIMARY KEY (PlanetID)
);

CREATE TABLE ItemGroup
(
  GroupID INT NOT NULL,
  ResultID INT NOT NULL,
  PRIMARY KEY (GroupID, ResultID)
);

CREATE TABLE Place
(
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  PlaceID INT NOT NULL,
  PlanetID INT NOT NULL,
  PRIMARY KEY (PlaceID),
  FOREIGN KEY (PlanetID) REFERENCES Planet(PlanetID)
);

CREATE TABLE Movingtable
(
  whereTo INT NOT NULL,
  Direction INT NOT NULL,
  MoveID INT NOT NULL,
  PlaceID INT NOT NULL,
  PRIMARY KEY (MoveID),
  FOREIGN KEY (PlaceID) REFERENCES Place(PlaceID)
);

CREATE TABLE Player
(
  PlayerID INT NOT NULL,
  Money INT NOT NULL,
  MaxWeight INT NOT NULL,
  PlaceID INT NOT NULL,
  PRIMARY KEY (PlayerID),
  FOREIGN KEY (PlaceID) REFERENCES Place(PlaceID)
);

CREATE TABLE Object
(
  ObjectID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Takeable INT NOT NULL,
  PlaceID INT NOT NULL,
  PRIMARY KEY (ObjectID),
  FOREIGN KEY (PlaceID) REFERENCES Place(PlaceID)
);

CREATE TABLE Item
(
  ItemID INT NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Weight INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  PlayerID INT NOT NULL,
  ObjectID INT NOT NULL,
  GroupID INT NOT NULL,
  ResultID INT NOT NULL,
  PRIMARY KEY (ItemID),
  FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
  FOREIGN KEY (ObjectID) REFERENCES Object(ObjectID),
  FOREIGN KEY (GroupID, ResultID) REFERENCES ItemGroup(GroupID, ResultID)
);
Copy