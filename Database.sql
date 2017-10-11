CREATE DATABASE pizzaDB;
USE pizzaDB;

CREATE USER 'dbuser04'@'localhost' IDENTIFIED BY 'salasana';
GRANT SELECT, INSERT, UPDATE ON pizzaDB.* TO dbuser04@localhost;

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


# Insert script for Pizza-Hat Express
# planetID , name , description
# home-planet
INSERT INTO planet VALUES (1, 'home-planet', 'You live here');
# Proteus
INSERT INTO planet VALUES (21, "Mars 39", "Mars 39 is a small planet in Proteus. There is a small shop, entrance to the bazaar, proteus landing station and a pizza-hat.");
INSERT INTO planet VALUES (22, "React", "React 39 is a small planet in Proteus. There is a small shop, entrance to the bazaar, proteus landing station and a pizza-hat.");
INSERT INTO planet VALUES (23, "MjolnerX", "MjolnerX is a small planet in Proteus. There is a small shop, entrance to the bazaar, proteus landing station and a pizza-hat.");
INSERT INTO planet VALUES (24, "Faringate", "The poorly-fitted-space-ship dives through a sandstorm. Unfortunately this planet does not have a emergency beacon system and your ship has no idea where to land. It crashes to a rocky mountain wall.");
INSERT INTO planet VALUES (25, "RockScorp", "RockScorp is a small planet in Proteus. There is a small shop, entrance to the bazaar, proteus landing station and a pizza-hat.");
INSERT INTO planet VALUES (26, "Marian", "The poorly-fitted-space-ship dives towards the planet and as soon as it hits the atmosphere it starts rapidly melting. Marian planet has an acidic climate and for some reason your ship didn't pick it up, propably because some of it's sensors broke down during the impact.");
# HIP-17710
INSERT INTO planet VALUES (31, 'HIP-17710 Planet 1','This planet seems deserted');
INSERT INTO planet VALUES (32, 'HIP-17710 Planet 2','A rocky planet with fiery winds.');
INSERT INTO planet VALUES (33, 'HIP-17710 Planet 3','Small watery planet. This is the main living place for habitants of HIP-17710 system.');
INSERT INTO planet VALUES (34, 'Fueling station', 'Please enjoy your stay.');
# Cernobog
INSERT INTO planet VALUES (41, 'cernobog-planet-1', 'An icy deserted planet that has nothing in it.');
INSERT INTO planet VALUES (42, 'cernobog-planet-2', 'This planet contains the rebel forces.');
INSERT INTO planet VALUES (43, 'cernobog-planet-3', 'This planet contains the evil forces base.');

#placeID , name , description , planetID
# home-planet
INSERT INTO place VALUES (1, 'home', 'Its your home, nice and tidy... Well not tidy but still nice. Basthroom is located in south and front door is located in east.', 1);
INSERT INTO place VALUES (2, 'goverment-building', 'Nothing special here its just a giant hall for fancy people. The agents seems to wait at the door in east', 1);
INSERT INTO place VALUES (3, 'poorly-fitted-space-ship', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 1);
INSERT INTO place VALUES (4, 'control-room', 'Everything inside the space ship looks outdated. Here is a control panel whit some old buttons in it also next to it is a giant red button. And in south is a gargo room.', 1);
INSERT INTO place VALUES (5, "bathroom", "could use some cleaning", 1);
# Proteus
INSERT INTO place VALUES (21,"Shop", "In the shop you can to buy all what you need, from food to engine parts", 21);
INSERT INTO place VALUES (22,"Entrance to Bazaar", "Entrance to Proteus bazaar. You are not welcome there, they do not accept outsiders.", 21);
INSERT INTO place VALUES (23,"Sewer entrance", "A grim place, this is the only way to the sewer.", 1);
INSERT INTO place VALUES (24,"Proteus Landing", "Proteus landing is a main starship station in the planet. To your north you see the front entrance to the main bazaar. To your south there is a pizza-hat restaurant! To the west of you there is the entrance to city's sewage dump.", 21);
INSERT INTO place VALUES (25,"Pizza-hat", "A Pizza-hat restaurant. They don't recognise you as one of their own. Down the road to south there is a vehicle parked.", 21);
INSERT INTO place VALUES (26,"Sewer", "This stinky place has all kinds of living and dead junk in it. There seems to be a ladder at the end of it.", 21);
INSERT INTO place VALUES (27, "Near the Pizza-Hat", "A vehicle is parked here. It seems like no one has touched the vehicle for weeks.", 21);
INSERT INTO place VALUES (28, "poorly-fitted-space-ship", "The new repaired ship. You have no idea how you got it to work, but it works like a charm.",21);


# HIP-17710
INSERT INTO place VALUES (31, 'intergalactic-refueling-station', "This fueling station orbits the system at a close distance. The public transportation system can be used to travel to the other planets. They also sell all kinds of alien grocerys", 34);
INSERT INTO place VALUES (32, 'landing-Zone', "This is the landing zone of planet 1. The sandy dunes seem to continue to the horizon and it's unlikely there is anything useful here", 31);
INSERT INTO place VALUES (33, 'landing-Zone', "This is the landing zone of planet 2. Looking West you can see some kind of alien residence. To the East of you there is an alien business that seems to be out of order.", 32);
INSERT INTO place VALUES (34, 'landing-Zone', "This is the landing zone of planet 3. A beatiful landscape opens beneath your eyes. You can see the endless sea infront of you as the ocean breeze whisks your face. Looking East you see a colorful boulevard with high rise buildings. To your North there is a shop that is equipped with the same company logo as yours, but you are not quite sure about the spelling..", 33);
INSERT INTO place VALUES (35, 'alien-business', "Sand dust and some planks covers the windows so you can't see inside of it. South of you there seems to be a way to get to the backyard.", 32);
INSERT INTO place VALUES (36, 'backyard', "Filled with metallic containers, propably some kind of dumpster. You can hear something scratching inside one of the containers.", 32);
INSERT INTO place VALUES (37, 'pizza-Hat-alley', "Familiar smell hits your nose upon entering the alley. It is no doubt a Pizza-Hat restaurant. You had no idea they had a restaurant at HIP-17710.", 33);
INSERT INTO place VALUES (38, 'boulevard', "A beatiful boulevard with high rise buildings. At the North end of the boulevard you can see the intergalactic sign for a bar and an ID of 36.", 33);
INSERT INTO place VALUES (39, 'bar-id:36', "This seems to be the go to place in HIP-17710. Someone hands you a flyer at the door written in native earth human language. 'Hjyvä bari hjyvä juoma.' You have no idea what it says. They sell all kinds of drinks from beer to alien extract.", 33);
INSERT INTO place VALUES (310, 'alien-residence', "Some living creature is walking around the building looking for something. It is surrounded with a fence that has a doorbell on it.",32);
INSERT INTO place VALUES (311, 'poorly-fitted-space-ship', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 34);
# Cernobog
INSERT INTO place VALUES (41, 'cernobog-planet-1-landing-zone', 'You cant see anything else than ice and its freaking cold out here. You better leave befor you freeze to death', 41);
INSERT INTO place VALUES (42, 'cernobog-planet-2-landing-zone', 'In the west is a museum, south has a market, in east is a pizza-hat and in north is a poorly fitted space ship.', 42);
INSERT INTO place VALUES (43, 'museum', 'Strange looking things are in here, your not sure could these be called art or simply junk, but you never really understood art. In the east is a landing zone and in norht is a WC.', 42);
INSERT INTO place VALUES (44, 'market', 'Here are some really strange things being sold, you cant even tell what they are. In the north is the landing zone and in east is a pharmacy.', 42);
INSERT INTO place VALUES (45, 'pizza-hat', 'It seems that where ever you go, there is going to be pizza-hat in it. you cant escape your fate of beeing pizza delivery boy to the rest of your life. In the west is a landing zone.', 42);
INSERT INTO place VALUES (46, 'pharmacy', 'Its a basic looking pharmacy, here is your everyday medicine sold as well as something that should not be sold in here. In west is a market.', 42);
INSERT INTO place VALUES (47, 'cernobog-planet-3-landing-zone', 'You see a huge gate in north which lead to a mansion, that must be where the evil forces are keeping the princess. In south is a poorly fitted space ship', 43);
INSERT INTO place VALUES (48, 'gate-to-mansion', 'A huge gate which leads to a mansion in north and in south is a landing zone.', 43);
INSERT INTO place VALUES (49, 'lounge', 'A big lounge which has entryes to east hallway and west hallway.', 43);
INSERT INTO place VALUES (410, 'east-hallway', 'Long hallway which has many doors in it, all of them seems to be locked. In the east side of hallway is a east wing and in west is lounge.', 43);
INSERT INTO place VALUES (411, 'east-wing', 'Seems to be a living quater for guards. In the west is a east hallway.', 43);
INSERT INTO place VALUES (412, 'west-hallway', 'Long hallway Which has many doors in it, all of them seems to be locked. In the west side of hallway is a west wing and in east is lounge.', 43);
INSERT INTO place VALUES (413, 'west-wing', 'Here seems to be three doors, all of them are locked. One of the doors got lable dungeon in it, perhaps the princess is kept in there. In the nort is a dungeon and in east is a west hallway.', 43);
INSERT INTO place VALUES (414, 'dungeon', 'Basic dungeon', 43);
INSERT INTO place VALUES (415, 'wc', 'Here is a toilet and a huge line of people waiting their turn. Here is also a turn ticket button and for some reason you cant leave wc whitouth wc turn ticket.', 42);
INSERT INTO place VALUES (416, 'poorly-fitted-space-ship', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 42);
INSERT INTO place VALUES (417, 'poorly-fitted-space-ship', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 43);
INSERT INTO place VALUES (1000, 'EXIT', "YOU WON THE GAME IF YOU ARE HERE.", 1);
# player
INSERT INTO player VALUES (1, 0, 80, 1);


# actionID , description
# home-planet
INSERT INTO actiontable VALUES (2, 'FROM THE GLORIOUS GOVERMENT: Dear Jack, the goverment needs you on an urgent mission. Please take all of your clothes with you and head to the Goverment building. You will need your drivers license.\n\nAs Jack is done with the reading his doorbell starts to ring. Please press the button, the sound is very anoying.');
INSERT INTO actiontable VALUES (3, 'As you go into shower, you start to feel like your life is being drained away. When you open the faucet and water comes down to you, you star to feel like your skin is melting away and you start to panick, you slip down and you hit your head...\n\nAfter a few hours you wake up. You completly forgot why you were here.');
INSERT INTO actiontable VALUES (4, 'You press the button in food store, it makes little explosion and pops a banana out. After that it breaks down and starts to smoke. Great now you have to fix it');
INSERT INTO actiontable VALUES (5, 'You press the button and nothing happens... You tougth that if you press the button it will work agian didnt you?');
INSERT INTO actiontable VALUES (6, 'UPDATE object SET usable = 1 WHERE objectID = 2 or objectID= 10');
INSERT INTO actiontable VALUES (7, 'You eat the banana.');
INSERT INTO actiontable VALUES (8, "You try to flush the toilet but its stuffed whit shit and the water flows over. You need to clean the tolet, but you don't want to do it right now");
INSERT INTO actiontable VALUES (9, "You wash your hands");
INSERT INTO actiontable VALUES (10, "Yes you want to flip the table, but you don't want to clean it up.");
# Proteus
INSERT INTO actionTable VALUES(21, 'Hello men i am a halographic device');
INSERT INTO actionTable VALUES(22, 'You opened the door');
INSERT INTO actionTable VALUES(23, 'Old notebook, not interested');
INSERT INTO actionTable VALUES(24, 'I am security number 185749464.');
INSERT INTO actionTable VALUES(25, 'You have to repair it first!');
INSERT INTO actionTable VALUES(26, 'You sit on it and then you stand up again. Stop wasting your time.');
INSERT INTO actionTable VALUES(27, 'He points you to the litter. Maybe his implying that you are worth the same.');
INSERT INTO actionTable VALUES(28, 'Hello Jack i can help you to find a key, you need a....');
INSERT INTO actionTable VALUES(29, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(210, "You don't have any currency on you!");
INSERT INTO actionTable VALUES(211, 'Please explain yourself?');
INSERT INTO actionTable VALUES(212, 'Hello! Your starship is broken? Thats too bad.');
INSERT INTO actionTable VALUES(213, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(214, 'UPDATE object SET usable = 1 WHERE objectID = 24');
INSERT INTO actionTable VALUES(215, 'UPDATE movingTable SET placeID = 24 WHERE moveID = 213');
INSERT INTO actionTable VALUES(216, 'Stealing is fine if you are starving, who am I to judge..');
INSERT INTO actionTable VALUES(217, "You like it, don't you?");
INSERT INTO actionTable VALUES(218, "You really think you are going to need this??");
INSERT INTO actionTable VALUES(219, "I don't know what you think you are but a locksmith ain't one of those things.");
INSERT INTO actionTable VALUES(220, "RAWR!");

# HIP-17710
INSERT INTO actiontable VALUES (31, 'UPDATE item SET objectID = 32 WHERE itemID = 32');
INSERT INTO actiontable VALUES (32, "Jack opens the box and sees a note in it.");
INSERT INTO actiontable VALUES (33, "UPDATE object SET usable = 1 WHERE objectID = 311");
INSERT INTO actiontable VALUES (34, "Drinks can be seen at the end of this table.");
INSERT INTO actiontable VALUES (36, "It's locked!");
# Cernobog
INSERT INTO actiontable VALUES (42, 'You combine all the pizza ingredients.');
INSERT INTO actiontable VALUES (43, 'You put the raw pizza in the oven. after a while you take the pizza out and now you have a frehly made pizza whit you.');
INSERT INTO actiontable VALUES (44, 'You combine the pizza whit lethal poison 3000.');
INSERT INTO actiontable VALUES (46, 'UPDATE object SET usable = 1 WHERE objectID = 411');
INSERT INTO actiontable VALUES (47, 'UPDATE object SET usable = 1 WHERE objectID = 413');
INSERT INTO actiontable VALUES (48, 'UPDATE object SET usable = 1 WHERE objectID = 410');
INSERT INTO actiontable VALUES (49, 'UPDATE object SET usable = 1 WHERE objectID = 48');
INSERT INTO actiontable VALUES (410, 'UPDATE object SET usable = 1 WHERE objectID = 415');
#storyMode
INSERT INTO actiontable VALUES (765, "The creature walks to you and opens its mouth. 'RARARA RARA AKAKAKKAKA RARA KAKA RAKA.' You have no idea what the creature just said..");
INSERT INTO actiontable VALUES (766, "Suddenly the holographic-device starts to work again: 'HAVE YOU FOUND IT? YOU HAVE IT RIGHT?' You have no clue what the creature wants and decide to leave the scene.");
INSERT INTO actiontable VALUES (767, "It must be talking about the strange pet you found. You show the pet to it and the creature grabs it from your hands before you can say anything. The creature seems to be happy about it.");
INSERT INTO actiontable VALUES (768, "The creature opens its mouth again 'LOLOLO LALALA LOLLEROOOO LALALLALAAA LOL' He hands you a bag of some strange substance.");
INSERT INTO actiontable VALUES (770, "You use the elevator and ascend to the terrace. You can see far into the horizon. A strange looking man is staring you at the counter. You decide to just ignore him.");
INSERT INTO actiontable VALUES (771, "As you explore the terrace the strange man comes near you and starts to talk with you.");
INSERT INTO actiontable VALUES (772, "He asks you if you would like to answer some questions he has.");
INSERT INTO actiontable VALUES (777, "The fuel seems to be working. The engines run like a charm and you are able to leave the system for good.");
INSERT INTO actiontable VALUES (778, "It seems that the destination system is relatively close by. As the hyperdrive travel takes only two earth hours.");

INSERT INTO actiontable VALUES (880, "The ladder shoots down from the ceiling and you begin to climb it. You stop for a moment to wait if you could hear what the creatures are speaking in the shop. As you get closer to the ceiling it's obvious to you that you have no idea even what language they are speaking. You wait for the conversation to end.");
INSERT INTO actiontable VALUES (881, "The holographic device suddenly starts to translate the ongoing conversation to you. It surely is a remarkable piece of technology.");
INSERT INTO actiontable VALUES (882, "HOLOGRAPHIC DEVICE: 'You buy me good product last week gooooooood.' 'Yesss very goood you like yes.' 'I very like yesssss.' 'HuehueHEUE:DHEUHEUYHUE:DD' ");
INSERT INTO actiontable VALUES (883, "The device starts to make strange noices so you decide to just ignore it. Maybe it's not perfect after all. The 'creatures' seem to be leaving the shop.");
INSERT INTO actiontable VALUES (884, "You climb in to your trusty seat and push the star ship keycard into into the keyhole. As you press the button nothing happens. Smoke starts to rise from the control panel and desperation takes over your mind. You have failed once again, who knows how long you will be stuck in this god forbidden place.");
INSERT INTO actiontable VALUES (885, "Anger takes over you and you hit the panel with your fist.");
INSERT INTO actiontable VALUES (886, "You hear a load BANG from behind and the whole ship trembles from the shockwave. Suddenly the ship's systems power up and the engines start to rev up. ");
INSERT INTO actiontable VALUES (887, "You and the poorly-fitted-space-ship made it! The two of you leave the Proteus solar system and continue your journey. As you rushed the repairs you had to take off the movie display, what a shame, there is no movie to display now. You decide to rest your eyes, after all it has been a rough journey so far.");
INSERT INTO actiontable VALUES (888, "You snap out of your dreams as the ships alarm system is screaming at you. Almost every warning light is flashing on the dashboard. You have no idea what is wrong this time. The graphical interface informs you that you are about to land on HIP-17710. You have no idea what that is.");
INSERT INTO actiontable VALUES (889, "It seems that the new poorly-modified-engine eats a lot more fuel than the factory one. You almost ran out of fuel in the middle of the deep cold space. Imagine what that would have been like, just drifting through space waiting for the inevitable death. Luckily the ships graphical interface saves you again!");
INSERT INTO actiontable VALUES (895, "You press the button and a lid opens revealing the keypad. It's equipped with buttons from 1 to 9. Buttons 1, 2 and 3 are clearly dirty and have been used the most.");
INSERT INTO actiontable VALUES (896, "The trunk opens and reveals a set of mechanical tools.");
INSERT INTO actiontable VALUES (897, "!!BURGLARY DETECTED!!. The car alarm goes off and before you even realize what is going on a set of explosives blasts your waist completely off.");
INSERT INTO actiontable VALUES (899, "They don't really care what you have to say. They just crab you by the arms and cram you in to their car.");
INSERT INTO actiontable VALUES (990, "You opened THE DOOR... congrats. Outside the door is standing two big guys clad in black suits, they just stare you and in a moment they take something out of their pocket. It seems to be a governments secret agents card. After that they put the cards away and asks you to come whit them. do you accept the offer? ");
INSERT INTO actiontable VALUES (991, "You arrive at the government building with the agents, as you go inside the agents asks you to wait here for a while. The agents enters a room.");
INSERT INTO actiontable VALUES (992, "After a while the agents comes out of the room and asks you to go in. You enter the room and you can see the president sitting on the far end of the table. The president asks you to sit down and offers you a cup of tea. Although you much more prefer coffee you take the offer and sit down. After you have sat down, the president tells you that his wife has been kidnapped and he wants you to go rescue her, because you are the famous hero who has saved the humanity many times. Obviously the guy that the president is talking about is not you, but you seem to have some problems opening your mouth to correct the fact, so you have to settle whit the idea of being a hero. The president dismisses you and you leave the room.");
INSERT INTO actiontable VALUES (993, "The two agents gives you a starship key card and points you to your space ship which is located in east.");
INSERT INTO actiontable VALUES (995, "You can feel the thrusters starting up and a quick yank as you begin to ascend away from your home planet. The poorly fitted space ship trembles and shakes vigorously, it feels like the ship is not meant to handle situations like this. You hear metallic rattling behind you but it's impossible to turn your head around and see what's making the noise as the acceleration pulls you to your seat. Your only option is to wait and see what happens.");
INSERT INTO actiontable VALUES (996, "A moment passes and you can feel the gravity fading away. Your arms feel light and they begin to float. The poorly fitted space ship is not fitted with windows, the only information you can get is from the graphical interface that has been projected in front of you. The green sphere that represents your former home planet is slowly fading away, when suddenly the metallic rattling and all other noises disappear, you have entered the deep cold space. The graphical interface informs you that the ship is lining for outer space hyperdrive acceleration. You must wait for the engines to power up.");
INSERT INTO actiontable VALUES (997, "The graphical interface informs you that hyperdrive acceleration is ready and begins the countdown. As the countdown hits zero your chair starts to shake and the poorly fitted space ship leaves the solar system. The graphical interface starts broadcasting the latest Adam Sandler movie. You try to set the chair to a comfort setting but the lever breaks. You must wait for the movie to finish.");
INSERT INTO actiontable VALUES (998, "Just as the movie is about to reach its climax large asteroid hurls to the side of your ship. It rips one of the engines and the ship starts to spin uncontrollable. Your life starts to flash before your eyes, you mostly see a lot of pizza. All the warning lights turn on and a loud alarm starts to blare. You have no idea how to react to the situation, you were not trained for this! The ships emergency systems activate, but the movie doesn't stop. A text appears on the graphical interface:");



INSERT INTO actiontable VALUES (1040, "You put all the pizza ingredients into the pizza maker and press the button. After a few seconds the machine pops out a perfect pizza base. You take the raw pizza and put it into an oven and now you wait.");
INSERT INTO actiontable VALUES (1041, "After a while you take the pizza out of the oven and now you have a freshly made pizza whit you.");
INSERT INTO actiontable VALUES (1042, "You take the wc turn ticket it has number 4783 and the ongoing number is 4768. It seems that you have to wait for a while.");
INSERT INTO actiontable VALUES (1043, "As you are waiting you notice that you actualy need to use wc. The longer you are waiting the more it feels that your ass is going to explode. The ongoing number is 4776");
<<<<<<< HEAD
INSERT INTO actiontable VALUES (1044, "Finally its your turn to use the wc. You put the ticket in the door and it opens. You go in and take of your pants and sit in the toilet. The moment you sit on the toilet, your ass explodes and you feel great relief, you can hear clearing noise and as you turn to watch the toilet you see that the toilet has broken in half... It seems that inside the toilet is a note. you take the note, wipe your ass, put the pant on and leave the wc");
=======
INSERT INTO actiontable VALUES (1044, "Finaly its your turn to use the wc. You put the ticket in the door and it opens. You go in and take of your pants and sit on the toilet. The moment you sit on the toilet, your ass explodes and you feel great relief. As you finished you business and take toilet paper a note drops from the toilet paper stand. you take the note, finish your business and then you leave the wc.");
>>>>>>> 8a865965b19e21b9d645e2f8460f0d67061d8c66
INSERT INTO actiontable VALUES (1045, "You input the information on the note to your space ship and then you press the button. After a few moments your lands in a cernobog planet 3 landing zone.");
INSERT INTO actiontable VALUES (1046, 'You press the doorbell after a while guard comes and asks you what do you want. You give him the poison pizza 3000 and you say that somebody ordered pizza to be delivered here. Guard takes the pizza, he thanks you and leaves. After that you can hear the guard yelling "Boys looks like we have some pizza to breakfast."');
INSERT INTO actiontable VALUES (1047, "As you are waiting, you look around to see anything where you could go inside and you realize that the guard who came to open the gate left with such a hurry that he forgot to close the gate. Its probably safe to go inside now.");
INSERT INTO actiontable VALUES (1048, "You leave Cernobog with the princess and head home. After several hours of flying you arrive to your home planet. You land on the governments landing pad and you come out of the poorly-fitted-space-ship with the princess. The two agents welcomes both of you and then they ask you to wait here and they escort the princess to the presidents room.");
INSERT INTO actiontable VALUES (1049, "After a while the agents come back from the room and offers you a huge amount of money and new position in government. Do you accept the new position? (Y/N)");
INSERT INTO actiontable VALUES (1050, "You accept the new position and the two agents gives you the money and a letter containing all the information you need to know about your new position. Never again you need to deliver pizza, although it seems that your peaceful live ends today.");
INSERT INTO actiontable VALUES (1051, "You refuse the new position and the two agents gives you the money. You head back home and look the amount of money you got. Never again you need to deliver pizza and you can peacfully spend the rest of your life doing anything you like.");
# typeID , typename
#home-planet
INSERT INTO objecttype VALUES (1, 'door');
INSERT INTO objecttype VALUES (2, 'button');
#Proteus
INSERT INTO objecttype VALUES (21, 'Door');
INSERT INTO objecttype VALUES (22, 'Holographic device');
#HIP-17710
INSERT INTO objecttype VALUES (31, 'dumpster');
INSERT INTO objecttype VALUES (32, 'box');
#Cernobog
INSERT INTO objecttype VALUES (41, 'door');
INSERT INTO objecttype VALUES (42, 'button');
INSERT INTO objecttype VALUES (43, 'hatch');
INSERT INTO objecttype VALUES (44, 'oven');

# gourpID , resultID
#Proteus
INSERT INTO itemGroup VALUES (277, 288);
#HIP-17710
INSERT INTO itemGroup VALUES (31, 36);
INSERT INTO itemGroup VALUES (32, 38);
INSERT INTO itemGroup VALUES (33, 311);
#Cernobog
INSERT INTO itemgroup VALUES (41, 45);
INSERT INTO itemgroup VALUES (42, 46);
INSERT INTO itemgroup VALUES (43, 49);

# objectID , name , description , placeID , usable , locked,  typeID , actionID
# home-planet
INSERT INTO object VALUES (1, 'table', "It's just a table", 1, 1, NULL, NULL, 10);
INSERT INTO object VALUES (3, 'floor', 'The floor of your home, it has a nice pattern in it.', 1, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (4, 'Shower', "Shower that looks like its haven't been used in ages...", 5, 1, NULL, NULL, 3);
INSERT INTO object VALUES (5, 'computer', 'A computer which is in pretty good shape. It seems that you have a new email for you.', 1, 1, NULL, NULL, 2);
INSERT INTO object VALUES (6, 'food-store', 'Its a food store, here you can buy food and its deliverd into this device instantly. It has a button on it', 1, 1, NULL, 32, 4);
INSERT INTO object VALUES (7, 'broken-food-store', 'Its broken and it smokes.', NULL, 1, NULL, 32, 5);
INSERT INTO object VALUES (8, 'small-bed', 'Its a one person bed', 1, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (9, 'red-button', 'Big red button used to travel with the ship.', 3, 1, NULL, 2, NULL);
INSERT INTO object VALUES (10, 'doorbell', "It's a doorbell that rings if somebody wants in. Press to activate the doorbell", 1, 1, NULL, 2, NULL);
INSERT INTO object VALUES (11, 'two-agents', 'They look pretty dense, they just stand there doing nothing.', 2, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (12, "sink", "Basic sink, its a little bit dirty.", 5, 1, NULL, NULL, 9);
INSERT INTO object VALUES (13, "toilet", "Toilet full of crap. 'Somebody' forgot to flush yesterday.", 5, 1, NULL, NULL, 8);
# Proteus

INSERT INTO object VALUES (24, "sewer-door", "Entrance to the city's waste dump. A horrible smells creeps to your nose near it.", 24, 0, 1, 1, NULL);
INSERT INTO object VALUES (25, "empty-box", "An empty box.", 24, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (26, "floor", "Dirty floor", 24, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (27, "laptop", "It's broken", 24, NULL, NULL, NULL, 23);
INSERT INTO object VALUES (28, "security-guard", "I don't want to say anything to him.", 24,NULL, NULL, NULL, 24);
INSERT INTO object VALUES (29, "poorly-fitted-space-ship", "It's my starship. The other engine is missing and it's landing gear has collapsed.", 24, NULL, NULL, NULL, 25);
INSERT INTO object VALUES (212, "market-booth", "A booth that sells some goods to trusted outsiders", 22, 1,NULL, NULL, 210);
INSERT INTO object VALUES (213, "stool", "It's a old red stool", 22, 1, NULL, NULL, 26);
INSERT INTO object VALUES (214, "soldier", "I don't want to speak with him", 22, 1, NULL, NULL, 27);
INSERT INTO object VALUES (215, "litter", "Just some litter on the ground.", 22, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (219, "camera", "Big brother can see you. It looks broken.", 23, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (220, "ladder", "A drop down ladder that seems to lead to a shop. You can hear talking near the ladder.", 26, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (222, "lifeform", "Looks like some kind of animal, like a cat or something.", 26, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (226, "seller", "Seller looks like my boss. He's wandering near the booth.", 22, 1, NULL, NULL, 212);
INSERT INTO object VALUES (227, "camera", "Big brother can see you.", 21, 1, NULL, NULL, 210);
INSERT INTO object VALUES (228, "box", "A box of different parts.", 21, 1, NULL, NULL, 210);
INSERT INTO object VALUES (229, "table", "A table with some items on top", 25, NULL, NULL, NULL, 211);
INSERT INTO object VALUES (230, "camera", "Big brother can see you.", 25, NULL, NULL, NULL, 210);
INSERT INTO object VALUES (231, "counter", "Here you could place your order, if you had time for that..", 25, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (232, 'button', "A button near the ladder. What could possibly go wrong?", 26, 1, NULL, 2, NULL);
INSERT INTO object VALUES (233, "officer", "I don't want to speak with him, he looks tough", 22, 1, NULL, NULL, 27);
INSERT INTO object VALUES (234, "vehicle", "An old vehicle parked near the pizza-hat restaurant. It has a keypad near the trunk.", 27, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (235, "keypad", "Strange looking keypad with buttons on it. Press to activate the keypad", 27, 1, NULL, 2, NULL);
INSERT INTO object VALUES (236, "trunk", "Trunk of the car", NULL, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (237, "shelf", "A shelf full of stuff", 21, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (238, "red-button", "Big red button used to travel with the ship.", 28, 1, NULL, 2, NULL);
INSERT INTO object VALUES (239, "green-slime", "Green slime is hanging from the roof. Maybe stay away from it.", 26, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (240, "old-bicycle", "An old bicycle with both of its wheels bend. You didn't know these aliens could ride a bike.", 26, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (241, "safe", "A gigantic safe that has to weight more than your space ship", 21, NULL, NULL, NULL, 219);
INSERT INTO object VALUES (242, "stuffed-animal", "Looks like a crossover of a lion and a koala. Very strange..", 21, NULL, NULL, NULL, 220);


# HIP-17710
INSERT INTO object VALUES (31, 'red-dumpster', "A heavy metallic container with a stained smell near it. Something living is making noises inside it.", 36, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (32, 'stranger', "It seems to be looking for something.", 310, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (34, 'pizza-box', "Dirty and soggy, looks disgusting. A note is lying on it.", 37, NULL, NULL, 32, NULL);
INSERT INTO object VALUES (35, 'transportation-system', "Press to activate the public transportation system. You can use the system to travel between the planets.", 32, 1, NULL, 2, NULL);
INSERT INTO object VALUES (36, 'transportation-system', "Press to activate the public transportation system. You can use the system to travel between the planets.", 33, 1, NULL, 2, NULL);
INSERT INTO object VALUES (37, 'transportation-system', "Press to activate the public transportation system. You can use the system to travel between the planets.", 34, 1, NULL, 2, NULL);
INSERT INTO object VALUES (38, 'transportation-system', "Press to activate the public transportation system. You can use the system to travel between the planets.", 31, 1, NULL, 2, NULL);
INSERT INTO object VALUES (39, 'elevator',"Elevator which leads to the terrace. Press the elevator button to call the elevator car.", 39, 1, NULL, 2,NULL);
INSERT INTO object VALUES (310, 'strange-man', "He looks strange", 39, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (311, 'red-button', "Big red button used to travel with the ship.", 311, NULL, NULL, 2, NULL);
INSERT INTO object VALUES (312, 'fuel-vending-machine', "A vending machine that sells alien fuel.", 31, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (313, 'kiosk', "A kiosk of unnecessary things.", 31, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (314, 'bar-counter', "You can order drinks from here", 39, NULL, NULL, NULL, 34);
INSERT INTO object VALUES (315, 'green-dumpster', "A heavy metallic container with a stained smell near it.", 36, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (316, 'yellow-dumpster', "A heavy metallic container with a stained smell near it.", 36, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (317, 'doorbell', "Doorbell near the fence gate. Press to use it", 310, 1, NULL, 2, NULL);
INSERT INTO object VALUES (318, 'fence-gate', "It's locked.", 310, 1, NULL, NULL, 36);


# Cernobog
INSERT INTO object VALUES (41, 'toilet', "It's a toilet, nothing more about that", 415, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (42, 'cold-pool', "It's used to keep food fresh, there seems to be some tasty looking things.", 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (43, 'vegetable-shelf', 'Here seems to be all kinds of vegetables.', 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (44, 'dry-food-shelf', 'Its full of dry food ingredients.', 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (45, 'drug-shelf', "Its full of all kinds of drugs", 46, 1, NULL, 43, NULL);
INSERT INTO object VALUES (46, 'pizza-oven', "It's used to make delicious pizzas", 45, 1, NULL, 44, NULL);
INSERT INTO object VALUES (47, 'gate', "It's a really big gate", 48, 0, 1, 1, NULL);
INSERT INTO object VALUES (48, 'doorbell', "It's a white button that rings a doorbell.", 48, 1, NULL, 2, NULL);
INSERT INTO object VALUES (49, 'fallen-guards', 'Seem like the pizza did its job. At least ten guards is lying dead in the ground.', 411, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (410, 'dungeon-door', 'Its a door to the dungeon.', 413, 0, 1, 1, NULL);
INSERT INTO object VALUES (411, 'pizza-maker', 'Its used to make pizza base by putting ingredints in it, it has a button in it.', 45, 1, NULL, 2, NULL);
INSERT INTO object VALUES (412, 'wc-turn-ticket-button', 'It gives you a turn ticket to wc.', 415, 1, NULL, 2, NULL);
INSERT INTO object VALUES (413, 'red-button', 'Big red button used to travel with the ship.', 416, 0, 1, 2, NULL);
INSERT INTO object VALUES (414, 'handcuffs', "These are used to chain people", 414, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (415, 'red-button', 'Big red button used to travel with the ship.', 417, 0, NULL, 2, NULL);
INSERT INTO object VALUES (416, "painting", "Painting of a strange alien structure. No idea what it is.", 43, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (417, "sculpture", "A human sized sculpture, that looks like an alien soldier.", 43, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (418, "table", "A lonely table in the corner, maybe its some form of art.", 43, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (419, "pizza-hat-owner", "He doesn't seem to care that I am here.", 45, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (420, "pizza-hat-worker", "He seems to be busy, beter not to disturb him.", 45, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (421, "desk", "Just a desk", 45, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (422, "Warning-sign", "A sign that has something written on it.", 48, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (423, "desk", "Just a desk, nothing else.", 49, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (424, "key-shelf", "Its full of keys, unfortunately it's locked.", 49, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (435, "blue-carpet", "It's a long blue carpet, covering the whole floor of the hallway.", 410, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (436, "red-carpet", "It's a long red carpet, covering the whole floor of the hallway.", 412, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (437, "double-beds", "Here is six double beds, I don't know why guards would have double beds, but not my problem.", 411, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (438, "cabinet", "Here is twelve cabinets, every one of them has a padlock in it.", 411, NULL, NULL, NULL, NULL);


# moveID , whereTo , direction , placeID , objectID
#home-planet
INSERT INTO movingtable VALUES (2, 3, 'e', 2, NULL);
INSERT INTO movingtable VALUES (3, 4, 'n', 3, NULL);
INSERT INTO movingtable VALUES (4, 3, 's', 4, NULL);
INSERT INTO movingtable VALUES (5, 2, 'w', 3, NULL);
INSERT INTO movingtable VALUES (6, 1, 'n', 5, NULL);
INSERT INTO movingtable VALUES (7, 5, 's', 1, NULL);
# Proteus
INSERT INTO movingTable VALUES (21 , 22, "n", 24, NULL);
INSERT INTO movingTable VALUES (22 , 25, "s", 24, NULL);
INSERT INTO movingTable VALUES (23 , 24, "s", 22, NULL);
INSERT INTO movingTable VALUES (24 , 24, "n", 25, NULL);
INSERT INTO movingTable VALUES (25 , 23, "w", 24, 24);
INSERT INTO movingTable VALUES (26 , 24, "e", 23, NULL);
INSERT INTO movingTable VALUES (27 , 26, "n", 23, NULL);
INSERT INTO movingTable VALUES (28 , 23, "s", 26, NULL);
INSERT INTO movingTable VALUES (29 , 21, "n", NULL, NULL);
INSERT INTO movingTable VALUES (210, 26, "s", 21, NULL);
INSERT INTO movingTable VALUES (211, 27, "s", 25, NULL);
INSERT INTO movingTable VALUES (212, 25, "n", 27, NULL);
INSERT INTO movingTable VALUES (213, 28, "e", NULL, NULL);
INSERT INTO movingTable VALUES (214, 24, "w", 28, NULL);
#HIP-17710
#Planet 2
INSERT INTO movingtable VALUES (31, 310, 'w', 33, NULL);
INSERT INTO movingtable VALUES (32, 33, 'e', 310, NULL);
INSERT INTO movingtable VALUES (33, 35, 'e', 33, NULL);
INSERT INTO movingtable VALUES (34, 33, 'w', 35, NULL);
INSERT INTO movingtable VALUES (35, 36, 's', 35, NULL);
INSERT INTO movingtable VALUES (36, 35, 'n', 36, NULL);
#Planet 3
INSERT INTO movingtable VALUES (37, 38, 'e', 34, NULL);
INSERT INTO movingtable VALUES (38, 34, 'w', 38, NULL);
INSERT INTO movingtable VALUES (39, 39, 'n', 38, NULL);
INSERT INTO movingtable VALUES (310, 38, 's', 39, NULL);
INSERT INTO movingtable VALUES (311, 37, 'n', 34, NULL);
INSERT INTO movingtable VALUES (312, 34, 's', 37, NULL);
#Fuel station
INSERT INTO movingtable VALUES (313, 311, 'n', 31, NULL);
INSERT INTO movingtable VALUES (314, 31, 's', 311, NULL);


#Cernobog
INSERT INTO movingtable VALUES (41, 42, NULL, 41, NULL);
INSERT INTO movingtable VALUES (42, 41, NULL, 42, NULL);
INSERT INTO movingtable VALUES (43, 43, 'w', 42, NULL);
INSERT INTO movingtable VALUES (44, 44, 's', 42, NULL);
INSERT INTO movingtable VALUES (45, 45, 'e', 42, NULL);
INSERT INTO movingtable VALUES (46, 42, 'e', 43, NULL);
INSERT INTO movingtable VALUES (47, 42, 'n', 44, NULL);
INSERT INTO movingtable VALUES (48, 46, 'e', 44, NULL);
INSERT INTO movingtable VALUES (49, 42, 'w', 45, NULL);
INSERT INTO movingtable VALUES (410, 44, 'w', 46, NULL);
INSERT INTO movingtable VALUES (411, 47, NULL, 41, NULL);
INSERT INTO movingtable VALUES (412, 47, NULL, 42, NULL);
INSERT INTO movingtable VALUES (413, 41, NULL, 47, NULL);
INSERT INTO movingtable VALUES (414, 42, NULL, 47, NULL);
INSERT INTO movingtable VALUES (415, 48, 'n', 47, NULL);
INSERT INTO movingtable VALUES (416, 47, 's', 48, NULL);
INSERT INTO movingtable VALUES (417, 49, 'n', 48, 47);
INSERT INTO movingtable VALUES (418, 48, 's', 49, NULL);
INSERT INTO movingtable VALUES (419, 410, 'e', 49, NULL);
INSERT INTO movingtable VALUES (420, 412, 'w', 49, NULL);
INSERT INTO movingtable VALUES (421, 49, 'w', 410, NULL);
INSERT INTO movingtable VALUES (422, 411, 'e', 410, NULL);
INSERT INTO movingtable VALUES (423, 410, 'w', 411, NULL);
INSERT INTO movingtable VALUES (424, 49, 'e', 412, NULL);
INSERT INTO movingtable VALUES (425, 413, 'w', 412, NULL);
INSERT INTO movingtable VALUES (426, 412, 'e', 413, NULL);
INSERT INTO movingtable VALUES (427, 414, 'n', 413, 410);
INSERT INTO movingtable VALUES (428, 413, 's', 414, NULL);
INSERT INTO movingtable VALUES (429, 415, 'n', 43, NULL);
INSERT INTO movingtable VALUES (430, 416, 'n', 42, NULL);
INSERT INTO movingtable VALUES (431, 42, 's', 416, NULL);
INSERT INTO movingtable VALUES (432, 47, 'n', 417, NULL);
INSERT INTO movingtable VALUES (433, 417, 's', 47, NULL);


# itemID , name , description, playerID , objectID , #groupID, actionID
# home-planet
INSERT INTO item VALUES (1, 'drivers-license', "It's an ordinary drivers license nothing more", NULL, 1, NULL, 6);
INSERT INTO item VALUES (2, 'starship-key-card', 'Old dusty starship key card for your poorly-fitted-space-ship.', NULL, 11, NULL, NULL);
INSERT INTO item VALUES (3, 'clothes', 'These are your clothes, nothing special about them.', NULL, 3, NULL, NULL);
INSERT INTO item VALUES (4, 'banana', 'Even though the food-store broke a banana popped out and looks edible.', NULL, 7, NULL, 7);
INSERT INTO item VALUES (5, 'banana-peel', "It's a banana peel, very slipery if you step on it.", NULL, NULL, NULL, NULL);

#Proteus
INSERT INTO item VALUES (21, 'engine-parts', "It's a part for you ship.", NULL, 228, 277, NULL);
INSERT INTO item VALUES (22, 'tools', "It's a special engine tools, combine it with you parts.", NULL, 236, 277, NULL);
INSERT INTO item VALUES (288, 'new-engine' , "It's a new engine for you starship, use it to starship.", NULL, NULL, NULL, 215);
INSERT INTO item VALUES (23, 'key', "It's a key from Pizza-hat door.", NULL, 231, NULL, NULL);
INSERT INTO item VALUES (24, "holographic-device", "A strange device. When you shine it against the sun a projection of an opened door can be seen.", NULL, 215, NULL, 214);
INSERT INTO item VALUES (25, 'banana-peel', "Old banana peels.", NULL, 215, NULL, NULL);
INSERT INTO item VALUES (26, 'tin-can', "Used tin can. Smells like cat food.", NULL, 215, NULL, NULL);
INSERT INTO item VALUES (27, 'goo', "Odd goo. Not sure if it's living or not.", NULL, 237, NULL, NULL);
INSERT INTO item VALUES (28, 'metal-scraps', "A pile of metal scraps, nothing useful here.", NULL, 237, NULL, NULL);
INSERT INTO item VALUES (29, 'glass-container', "There is a strange crystal inside a glass container. It makes a strange standing wave noise when you get near it.", NULL, 237, NULL, NULL);
INSERT INTO item VALUES (210, 'ketchup', "It's the same stuff as in earth! Incredible, though these guys use it with the pizza..", NULL, 229, NULL, 216);
INSERT INTO item VALUES (211, 'pepper', "A glass container of ground up pepper seeds.", NULL, 229, NULL, 216);
INSERT INTO item VALUES (212, 'old-crust', "Someone left the crust of their pizza on the plate.", NULL, 229, NULL, 217);
INSERT INTO item VALUES (213, 'smelly-fruit', "Some kind of fruit, smells terrible.", NULL, 212, NULL, 216);
INSERT INTO item VALUES (214, 'red-fruit', "Some kind of red fruit, no idea if it's edible.", NULL, 212, NULL, 216);
INSERT INTO item VALUES (215, 'clock', "Old digital watch, used for timekeeping", NULL, 212, NULL, 218);
INSERT INTO item VALUES (216, 'shoes', "Fresh looking shoes with three stripes", NULL, 212, NULL, 216);
INSERT INTO item VALUES (217, 'oily-rags', "Kind of looks like your clothes", NULL, 228, NULL, 217);
INSERT INTO item VALUES (218, 'bolts', "A handful of bolts", NULL, 228, NULL, 216);
INSERT INTO item VALUES (219, 'lightbulb', "An old-school lightbulb, probably used to replace headlights", NULL, 237, NULL, 216);


#HIP-17710
INSERT INTO item VALUES (31, 'domestic-pet', "It's round six big eyes stare at you. You are not quite sure if it's cute or terrifying", NULL, 31, NULL, 31);
INSERT INTO item VALUES (32, 'quantum-flux', "Strange running substance, not like anything you have seen before.", NULL, NULL, 32, NULL);
INSERT INTO item VALUES (33, 'note', "Strange note that has numbers written on it: '-1/12'", NULL, 34, NULL, NULL);
INSERT INTO item VALUES (34, 'intergalactic', "A 'beer' suitable for almost any species in this galaxy.", NULL, 314, 31, NULL);
INSERT INTO item VALUES (35, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 314, 31, NULL);
INSERT INTO item VALUES (36, 'brown-jelly', "A mixture of Intergalactic and HIPA-17710. Digesting this will surely result in time travel.", NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (37, 'glowing-vial', "Glows with a faint blue light, might be radioactive.", NULL, NULL, 32, NULL);
INSERT INTO item VALUES (38, 'vial-with-quantum-flux', "Now glows even brighter. Definitely radioactive.", NULL, NULL, 33, NULL);
INSERT INTO item VALUES (39, 'alien-fuel', "High power fuel for space ships.", NULL, 312, 33, NULL);
INSERT INTO item VALUES (310, 'elevator-button', "Press to call the elevator", NULL, 39, NULL, NULL);
INSERT INTO item VALUES (311, 'poorly-combined-spacefuel', "Glowing green liquid. It makes a sizzling noise and some fumes are rising from the surface", NULL, NULL, NULL, 33);
INSERT INTO item VALUES (320, 'party-cone-hat', "No idea why they sell these here.", NULL, 313, NULL, NULL);
INSERT INTO item VALUES (321, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 314, 31, NULL);
INSERT INTO item VALUES (322, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 31, 31, NULL);
INSERT INTO item VALUES (323, 'movie', "The latest Adam Sandler movie! Every spacetraveller must have one.", NULL, 313, NULL, 217);
INSERT INTO item VALUES (324, 'sun-glasses', "These look so slick, wearing these _has to_ increase the speed of space ships by 100%", NULL, 313, NULL, 217);
INSERT INTO item VALUES (325, 'book', "Python for dummies.", NULL, 31, NULL, 218);
INSERT INTO item VALUES (326, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 315, 31, NULL);
INSERT INTO item VALUES (327, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 316, 31, NULL);
INSERT INTO item VALUES (328, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", NULL, 315, 31, NULL);
INSERT INTO item VALUES (329, 'trash', "Pile of trash", NULL, 315, NULL, NULL);

# Cernobog
INSERT INTO item VALUES (41, 'pizza-dough', 'From this pizza dough you can make a pretty good pizza', NULL, 44, 41, NULL);
INSERT INTO item VALUES (42, 'alien-mushroom', 'Looks almost like normal mushrooms, but they smell like your socks.', NULL, 43, 41, NULL);
INSERT INTO item VALUES (43, 'alien-cheese', 'Looks like normal cheese, except its blue.', NULL, 42, 41, NULL);
INSERT INTO item VALUES (44, 'alien-meat', 'Delicious looking meat, thats all.', NULL, 42, 41, NULL);
INSERT INTO item VALUES (45, 'raw-pizza', 'Looks good but its still raw.', NULL, NULL, 42, NULL);
INSERT INTO item VALUES (46, 'pizza', 'Freshly made pizza, it smells a bit odd.', NULL, NULL, 43, 49);
INSERT INTO item VALUES (47, 'lethal-poison-3000', 'What ever you do with it, dont f***ing drink it, dont even smell it, just by looking at it your eyes hurt. So did you get the point? I hope so...', NULL, 45, 43, NULL);
INSERT INTO item VALUES (48, 'hulk-potion', 'A little bottle with hulk potion label on it, no idea what it means.', NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (49, 'poison-pizza-3000', 'It looks surprisingly good and smells really good, even though it will kill you the second your lips touch it.', NULL, NULL, 42, NULL);
INSERT INTO item VALUES (410, 'dungeon-key-card', 'A key card to the dungeon where the princess is probably kept.', NULL, 49, NULL, 48);
<<<<<<< HEAD
INSERT INTO item VALUES (411, 'shitty-note', "It's covered in poo and it smells terrible. This note contains the detailed location of the third planet in Cernobog. Also, it contains the information that the evil forces like to eat pizza with cheese, meat and mushrooms. They all are dumb enough to eat it, even if its full of poison.", NULL, NULL, NULL, 47);
INSERT INTO item VALUES (412, 'princess', "It's the princess, she seems to be unconscious.", NULL, 414, NULL, 410);
=======
INSERT INTO item VALUES (411, 'secret-note', "It's a note that containing secret information, it smells terrible. This note has detailed location of the third planet thats is in Cernobog system. Also it contains the information that the evil forces likes pizza with cheese, meat and mushrooms. They are also dump enough to eat it, even if its full of poison.", NULL, NULL, NULL, 47);
INSERT INTO item VALUES (412, 'princess', "Its the princess, she seems to be unconscious.", NULL, 414, NULL, 410);
>>>>>>> 8a865965b19e21b9d645e2f8460f0d67061d8c66
INSERT INTO item VALUES (413, "cabbage", "Nice looking purple cabbage.", NULL, 43, NULL, NULL);
INSERT INTO item VALUES (414, "carrot", "Moldy pink carrot.", NULL, 43, NULL, NULL);
INSERT INTO item VALUES (415, "rice", "bag of rice", NULL, 44, NULL, NULL);
INSERT INTO item VALUES (416, "bread", "Brown bread, doesn't look edible.", NULL, 44, NULL, NULL);
INSERT INTO item VALUES (417, "pink-bottle", "A bottle containing pink liquid, no idea what it is", NULL, 45, NULL, NULL);
INSERT INTO item VALUES (418, "green-bottle", "A bottle containing green liquid, it doesn't look very healthy", NULL, 45, NULL, NULL);
INSERT INTO item VALUES (419, "papers", "doesn't look very important, few of them contains some hand drawings.", NULL, 421, NULL, NULL);
INSERT INTO item VALUES (420, "book", "'SQL for dummies' a book containing information about sql.", NULL, 423, NULL, 218);
