
DROP TABLE IF EXISTS ITEM;
DROP TABLE IF EXISTS PLAYER;
DROP TABLE IF EXISTS MOVINGTABLE;
DROP TABLE IF EXISTS OBJECT;
DROP TABLE IF EXISTS OBJECTTYPE;
DROP TABLE IF EXISTS PLACE;
DROP TABLE IF EXISTS ITEMGROUP;
DROP TABLE IF EXISTS PLANET;
DROP TABLE IF EXISTS ACTIONTABLE;

CREATE TABLE planet
(
  planetID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  description TEXT,
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
  description TEXT,
  planetID INT,
  PRIMARY KEY (placeID),
  FOREIGN KEY (planetID) REFERENCES planet(planetID)
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
  typename VARCHAR(100),
  PRIMARY KEY (typeID)
);

CREATE TABLE object
(
  objectID INT NOT NULL,
  name VARCHAR(100),
  description TEXT,
  placeID INT,
  usable BIT,
  locked BIT,
  typeID INT,
  actionID INT,
  PRIMARY KEY (objectID),
  FOREIGN KEY (placeID) REFERENCES place(placeID),
  FOREIGN KEY (typeID) REFERENCES objecttype(typeID),
  FOREIGN KEY (actionID) REFERENCES actiontable(actionID)
);

CREATE TABLE movingTable
(
  moveID INT NOT NULL AUTO_INCREMENT,
  whereTo INT,
  direction VARCHAR(1),
  placeID INT,
  objectID INT,
  PRIMARY KEY (moveID),
  FOREIGN KEY (objectID) REFERENCES object(objectID),
  FOREIGN KEY (placeID) REFERENCES Place(placeID)
);

CREATE TABLE item
(
  itemID INT NOT NULL,
  name VARCHAR(100),
  description TEXT,
  playerID INT,
  objectID INT,
  groupID INT,
  actionID INT,
  PRIMARY KEY (itemID),
  FOREIGN KEY (actionID) REFERENCES actiontable(actionID),
  FOREIGN KEY (playerID) REFERENCES player(playerID),
  FOREIGN KEY (objectID) REFERENCES object(objectID),
  FOREIGN KEY (groupID) REFERENCES itemGroup(groupID)
);
