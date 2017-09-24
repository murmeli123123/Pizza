DROP TABLE IF EXISTS ITEM;
DROP TABLE IF EXISTS OBJECT;
DROP TABLE IF EXISTS PLAYER;
DROP TABLE IF EXISTS MOVINGTABLE;
DROP TABLE IF EXISTS OBJECTTYPE;
DROP TABLE IF EXISTS PLACE;
DROP TABLE IF EXISTS ITEMGROUP;
DROP TABLE IF EXISTS PLANET;
DROP TABLE IF EXISTS ACTIONTABLE;

CREATE TABLE planet
(
  planetID INT NOT NULL,
  name VARCHAR(100),
  description VARCHAR(255),
  PRIMARY KEY (planetID)
);

CREATE TABLE itemGroup
(
  groupID INT NOT NULL,
  resultID INT,
  PRIMARY KEY (groupID)
);

CREATE TABLE actionTable
(
  actionID INT NOT NULL,
  description TEXT,
  PRIMARY KEY (actionID)
);

CREATE TABLE place
(
  placeID INT NOT NULL,
  name VARCHAR(100),
  description VARCHAR(255),
  planetID INT,
  PRIMARY KEY (placeID),
  FOREIGN KEY (planetID) REFERENCES planet(planetID)
);

CREATE TABLE movingTable
(
  moveID INT NOT NULL,
  whereTo INT,
  direction INT,  
  placeID INT,
  PRIMARY KEY (moveID),
  FOREIGN KEY (placeID) REFERENCES Place(placeID)
);

CREATE TABLE player
(
  playerID INT NOT NULL,
  money INT,
  maxWeight INT,
  placeID INT,
  PRIMARY KEY (playerID),
  FOREIGN KEY (placeID) REFERENCES place(placeID)
);

CREATE TABLE objecttype
(
  typeID INT NOT NULL,
  objectname VARCHAR(100),
  PRIMARY KEY (typeID)
);

CREATE TABLE object
(
  objectID INT NOT NULL,
  name VARCHAR(100),
  description VARCHAR(255),
  placeID INT,
  usable BIT,
  typeID INT,
  actionID INT,
  PRIMARY KEY (objectID),
  FOREIGN KEY (placeID) REFERENCES place(placeID),
  FOREIGN KEY (typeID) REFERENCES objecttype(typeID),
  FOREIGN KEY (actionID) REFERENCES actiontable(actionID)
); 

CREATE TABLE item
(
  itemID INT NOT NULL,
  description VARCHAR(255),
  weight INT,
  name VARCHAR(100),
  playerID INT,
  objectID INT,
  groupID INT,
  resultID INT,
  PRIMARY KEY (itemID),
  FOREIGN KEY (playerID) REFERENCES player(playerID),
  FOREIGN KEY (objectID) REFERENCES object(objectID),
  FOREIGN KEY (groupID) REFERENCES itemGroup(groupID)
);
