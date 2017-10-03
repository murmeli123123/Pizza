# Insert script for Pizza-Hat Express
# planetID , name , description
# home-planet
INSERT INTO planet VALUES (1, 'home-planet', 'You live here');
# Proteus
INSERT INTO planet VALUES (21, "Mars 39", "Mars 39 is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (22, "React", "React 39 is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (23, "MjolnerX", "MjolnerX is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (24, "Faringate", "Its a lethal planet");
INSERT INTO planet VALUES (25, "RockScorp", "RockScorp is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (26, "Marian", "Its a lethal planet");
# HIP-17710
INSERT INTO planet VALUES (31, 'HIP-17710 Planet 1','This planet seems deserted');
INSERT INTO planet VALUES (32, 'HIP-17710 Planet 2','A rocky planet with fiery winds.');
INSERT INTO planet VALUES (33, 'HIP-17710 Planet 3','Small watery planet. This is the main living place for habitants of HIP-17710 system.');
# Cernobog
INSERT INTO planet VALUES (41, 'cernobog-planet-1', 'An icy deserted planet that has nothing in it.');
INSERT INTO planet VALUES (42, 'cernobog-planet-2', 'This planet contains the rebel forces.');
INSERT INTO planet VALUES (43, 'cernobog-planet-3', 'This planet contains the evil forces base.');

#placeID , name , description , planetID
# home-planet
INSERT INTO place VALUES (1, 'home', 'Its your home and as you look around you can see door located in east, small bed, food store, shower, table, computer and cloths lying on the floor (you migth want to wear them.)', 1);
INSERT INTO place VALUES (2, 'goverment-building', 'Nothing special here its just a giant hall for fancy people. The agents seems to wait at the door in east', 1);
INSERT INTO place VALUES (3, 'poorly-fitted-space-ship', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 1);
INSERT INTO place VALUES (4, 'control-room', 'Everything inside the space ship looks outdated. Here is a control panel whit some old buttons in it also next to it is a giant red button. And in south is a gargo room.', 1);
# Proteus
INSERT INTO place VALUES (21,"Shop", "In the shop you can to buy all what you need, from food to engine parts", 21);
INSERT INTO place VALUES (22,"Front Gate", "descriptions", 21);
INSERT INTO place VALUES (23,"Sewer entrance", "descriptions", 21);
INSERT INTO place VALUES (24,"Proteus Landing", "descriptions", 21);
INSERT INTO place VALUES (25,"Pizza-hat", "descriptions", 21);
INSERT INTO place VALUES (26,"Sewer", "descriptions", 21);
# HIP-17710
INSERT INTO place VALUES (31, 'intergalactic-refueling-station', "This fueling station orbits the system at a close distance. The public transportation system can be used to travel to the other planets. They also sell all kinds of alien grocerys", NULL);
INSERT INTO place VALUES (32, 'landing-Zone', "This is the landing zone of planet 1. The sandy dunes seem to continue to the horizon and it's unlikely there is anything useful here", 31);
INSERT INTO place VALUES (33, 'landing-Zzone', "This is the landing zone of planet 2. Looking West you can see some kind of alien residence. To the East of you there is an alien business that seems to be out of order.", 32);
INSERT INTO place VALUES (34, 'landing-Zone', "This is the landing zone of planet 3. A beatiful landscape opens beneath your eyes. You can see the endless sea infront of you as the ocean breeze whisks your face. Looking East you see a colorful boulevard with high rise buildings. To your North there is a shop that is equipped with the same company logo as yours, but you are not quite sure about the spelling..", 33);
INSERT INTO place VALUES (35, 'alien-business', "Sand dust and some planks covers the windows so you can't see inside of it. South of you there seems to be a way to get to the backyard.", 32);
INSERT INTO place VALUES (36, 'backyard', "Filled with metallic containers, propably some kind of dumpster. You can hear something scratching inside one of the containers.", 32);
INSERT INTO place VALUES (37, 'pizza-Hat-alley', "Familiar smell hits your nose upon entering the alley. It is no doubt a Pizza-Hat restaurant. You had no idea they had a restaurant at HIP-17710.", 33);
INSERT INTO place VALUES (38, 'boulevard', "A beatiful boulevard with high rise buildings. At the North end of the boulevard you can see the intergalactic sign for a bar and an ID of 36.", 33);
INSERT INTO place VALUES (39, 'bar-id:36', "This seems to be the go to place in HIP-17710. Someone hands you a flyer at the door written in native earth human language. 'Hjyvä bari hjyvä juoma.' You have no idea what it says. They sell all kinds of drinks from beer to alien extract.", 33);
INSERT INTO place VALUES (310, 'alien-residence', "Some living creature is walking around the building looking for something",32);
# Cernobog
INSERT INTO place VALUES (41, 'cernobog-planet-1-landing-zone', 'You cant see anything else than ice and its freaking cold out here. You better leave befor you freeze to death', 41);
INSERT INTO place VALUES (42, 'cernobog-planet-2-landing-zone', 'In the west is a museum, south has a market, in east is a pizza-hat and in north has a poorly fitted space ship.', 42);
INSERT INTO place VALUES (43, 'museum', 'Strange looking things are in here, your not sure could these be called art or simply junk, but you never really understood art. In the east is a landing zone.', 42);
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

# player
INSERT INTO player VALUES (1, 0, 80, 1);


# actionID , description
# home-planet
INSERT INTO actiontable VALUES (1, 'You opened THE DOOR... congrats.');
INSERT INTO actiontable VALUES (2, 'You read your email... you tougth that id tell you whats in it... Well... Okay just this once.');
INSERT INTO actiontable VALUES (3, 'As you go into shower, you start to feel like your life is being drained away. When you open the faucet and water comes down to you, you star to feel like your skin is melting away and you start to panick, you slip down and you hit your head... You are dead');
INSERT INTO actiontable VALUES (4, 'You press the button in food store, it makes little explosion and pops a banana out. After that it breaks down and starts to smoke. Great now you have to fix it');
INSERT INTO actiontable VALUES (5, 'You press the button and nothing happens... You tougth that if you press the button it will work agian didnt you?');
INSERT INTO actiontable VALUES (6, 'UPDATE object SET usable = 1 WHERE objectID = 2');
INSERT INTO actiontable VALUES (7, 'You eat the banana.');
# Proteus
INSERT INTO actionTable VALUES(21, 'Hello men i am a halographic device');
INSERT INTO actionTable VALUES(22, 'You opened the door');
INSERT INTO actionTable VALUES(23, 'Old notebook, not interested');
INSERT INTO actionTable VALUES(24, 'I am security number 185749464.');
INSERT INTO actionTable VALUES(25, 'Go next');
INSERT INTO actionTable VALUES(26, 'No now');
INSERT INTO actionTable VALUES(27, '...');
INSERT INTO actionTable VALUES(28, 'Hello Jack i can help you to find a key, you need a....');
INSERT INTO actionTable VALUES(29, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(210, 'Yes, i want to broke it, but not now');
INSERT INTO actionTable VALUES(211, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(212, 'Hello! Your starship is broken? you can find some parts in those box');
INSERT INTO actionTable VALUES(213, 'Hei, man it just a table');
# HIP-17710
INSERT INTO actiontable VALUES (31, "As Jack approaches, it makes some kind of growling noice but doesn't seem to be reluctant.");
INSERT INTO actiontable VALUES (32, "Jack opens the box and sees a note in it.");
# Cernobog
INSERT INTO actiontable VALUES (41, 'You go into a toilet. As you are doing you business, you see a note laying on the ground. you take the note and finnish your busines and leave.');
INSERT INTO actiontable VALUES (42, 'You combine all the pizza ingredients.');
INSERT INTO actiontable VALUES (43, 'You put the raw pizza in the oven. after a while you take the pizza out and now you have a frehly made pizza whit you.');
INSERT INTO actiontable VALUES (44, 'You combine the pizza whit lethal poison 3000.');
INSERT INTO actiontable VALUES (45, 'You press the doorbell after a while guard comes and asks you what do you want. You give him the poison pizza 3000 and you say that somebody ordered pizza to be delivered here. Guard takes the pizza, he thanks you and leaves. After that you can hear the guard yelling "Boys looks like we have some pizza to breakfast."');
#storyMode
INSERT INTO actiontable VALUES (995, "You feel the thrusters starting up and a quick yank as you begin to ascend away from your home planet. The poorly fitted space ship trembles and shakes vigorously, it feels like the ship is not meant to handle situations like this. You hear metallic rattling behind you but it’s impossible to turn your head around and see what’s making the noise as the acceleration pulls you to your seat. Your only option is to wait and see what happens.");
INSERT INTO actiontable VALUES (996, "A moment passes and you can feel the gravity fading away. Your arms feel light and they begin to float. The poorly fitted space ship is not fitted with windows, the only information you can get is from the graphical interface that has been projected in front of you. The green sphere that represents your former home planet is slowly fading away, when suddenly the metallic rattling and all other noises disappear, you have entered the deep cold space. The graphical interface informs you that the ship is lining for outer space hyperdrive acceleration. You must wait for the engines to power up.");
INSERT INTO actiontable VALUES (997, "The graphical interface informs you that hyperdrive acceleration is ready and begins the countdown. As the countdown hits zero your chair starts to shake and the poorly fitted space ship leaves the solar system. The graphical interface starts broadcasting the latest Adam Sandler movie. You try to set the chair to a comfort setting but the lever breaks. You must wait for the movie to finish.");
INSERT INTO actiontable VALUES (998, "Just as the movie is about to reach its climax large asteroid hurls to the side of your ship. It rips of one of the engines and the ship starts to spin uncontrollable. Your life starts to flash before your eyes, you mostly see a lot of pizza. All the warning lights turn on and a loud alarm starts to blare. You have no idea how to react to the situation, you were not trained for this! The ships emergency systems activate, but the movie doesn't stop. A text appears on the graphical interface:");



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
INSERT INTO itemGroup VALUES (33, 310);
#Cernobog
INSERT INTO itemgroup VALUES (41, 45);
INSERT INTO itemgroup VALUES (42, 46);
INSERT INTO itemgroup VALUES (43, 49);

# objectID , name , description , placeID , usable , locked,  typeID , actionID
# home-planet
INSERT INTO object VALUES (1, 'table', 'Its just a table', 1, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (2, 'door', 'Ordinary door, what did you expect?', 1, 0, 1, 1, NULL);
INSERT INTO object VALUES (3, 'floor', 'The floor of your home, it has a nice pattern in it.', 1, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (4, 'Shower', 'Shower that looks like its havent been used in ages...', 1, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (5, 'computer', 'A computer which is in pretty good shape. It seems that you have a new email for you.', 1, 1, NULL, NULL, 2);
INSERT INTO object VALUES (6, 'food-store', 'Its a food store, here you can buy food and its deliverd into this device instantly. It has a button on it', 1, 1, NULL, 2, 4);
INSERT INTO object VALUES (7, 'broken-food-store', 'Its broken and it smokes.', NULL, 1, NULL, 32, 5);
INSERT INTO object VALUES (8, 'small-bed', 'Its a one person bed', 1, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (9, 'red-button', 'Big red button', 3, 1, NULL, 2, NULL);
# Proteus
INSERT INTO object VALUES (21, "Pizza-hat-door", "Simple metal door", 24, 1 ,NULL, NULL, 22);
INSERT INTO object VALUES (22, "Front-Gate-door", "Simple metal door", 24, 1 ,NULL, NULL, 22);
INSERT INTO object VALUES (23, "Sewer-entrance door", "Simple metal door", 24, 1 ,NULL, NULL, 22);
INSERT INTO object VALUES (25, "Empty box", "Some box on the floor", 24, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (26, "Floor", "Dirty floor, where is cleaner?", 24, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (27, "Notebook", "It defenitely doesn't work.", 24, NULL, NULL, NULL, 23);
INSERT INTO object VALUES (28, "Security", "I dont want to say nothing to him.", 24,NULL, NULL, NULL, 24);
INSERT INTO object VALUES (29, "Starship", "Its my starship.", 24, NULL, NULL, NULL, 25);
INSERT INTO object VALUES (210, "Holographic device ", "You can use it", 22, 1, NULL, NULL, 21);
INSERT INTO object VALUES (211, "Proteus landing door", "Door to proteus landing place", 22, 1, NULL, NULL, 22);
INSERT INTO object VALUES (212, "Table", "Its just a table in the corner", 22, 1,NULL, NULL, 210);
INSERT INTO object VALUES (213, "Chair", "It's a old red chair", 22, 1, NULL, NULL, 26);
INSERT INTO object VALUES (214, "Soldier", "I dont want to speak with him", 22, 1, NULL, NULL, 27);
INSERT INTO object VALUES (215, "Garbage", "Garbage is garbage", 22, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (216, "Woman", "She do something, I don't understand what exactly.", 23, NULL, NULL, NULL, 28);
INSERT INTO object VALUES (217, "Sewer-door", "Door to proteus Sewer", 23, 1, NULL, NULL, 22);
INSERT INTO object VALUES (218, "Proteus landing door", "Door to the place where you ship", 23, 1, NULL, NULL, 22);
INSERT INTO object VALUES (219, "Camera", "Big brother see you.", 23, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (220, "Ladder", "It's ladder to the shop.", 26, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (221, "Sewer door", "Door to proteus Sewer", 26, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (222, "Proteus-landing-door", "Door to the place where you ship", 26, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (223, "Camera", "Big brother see you.", 26, NULL, NULL, NULL, 210);
INSERT INTO object VALUES (225, "ladder-to-serwer", "Ladder to serwer", 21, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (226, "seller", "Seller look like my boss", 21, 1, NULL, NULL, 212);
INSERT INTO object VALUES (227, "camera", "Big brother see you.", 21, 1, NULL, NULL, 210);
INSERT INTO object VALUES (228, "box", "In this box a lot of different parts.", 21, 1, NULL, NULL, 210);
INSERT INTO object VALUES (229, "Exit door", "Door to landing place", 25, NULL ,NULL, NULL, 22);
INSERT INTO object VALUES (230, "camera", "Big brother see you.", 25, NULL, NULL, NULL, 210);
INSERT INTO object VALUES (231, "table", "Big brother see you.", 25, NULL, NULL, NULL, 211);
# HIP-17710
INSERT INTO object VALUES (31, 'dumpster', "A heavy metallic container with a stained smell near it. Something living is making noices inside it.", 31, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (32, 'stranger', "It seems to be looking for something.", 310, NULL, NULL, NULL, NULL);
INSERT INTO object VALUES (33, 'closed-pizza-box', "Dirty and soggy, looks discusting.", 37, 1, NULL, 32, 32);
INSERT INTO object VALUES (34, 'opened-pizza-box', "Dirty and soggy, looks discusting. A note is lying on it.", 37, NULL, NULL, 32, NULL);
# Cernobog
INSERT INTO object VALUES (41, 'toilet', 'Its a toilet, nothing more about that', 43, 1, NULL, NULL, 41);
INSERT INTO object VALUES (42, 'cold-pool', 'Its used to keep food fresh, there seems to be some tasty looking things.', 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (43, 'vegetable-shelf', 'Here seems to be all kinds of vegetables.', 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (44, 'dry-food-shelf', 'Its full of dry food ingredients.', 44, 1, NULL, 43, NULL);
INSERT INTO object VALUES (45, 'drug-shelf', 'Its full of all kinds of drugs', 46, 1, NULL, 43, NULL);
INSERT INTO object VALUES (46, 'pizza-oven', 'Its used to make delicios pizzas', 45, 1, NULL, 44, NULL);
INSERT INTO object VALUES (47, 'gate', 'Its really big gate', 48, 1, NULL, 41, NULL);
INSERT INTO object VALUES (48, 'doorbell', 'Its a white button that rings a doorbell.', 48, 1, NULL, 42, 45);
INSERT INTO object VALUES (49, 'fallen-guard', 'Seem like the pizza did its job.', 411, 1, NULL, NULL, NULL);
INSERT INTO object VALUES (410, 'dungeon-door', 'Its a door to the dungeon.', 413, 1, NULL, NULL, NULL);

# moveID , whereTo , direction , placeID
#home-planet
INSERT INTO movingtable VALUES (1, 2, 'e', 1, 2);
INSERT INTO movingtable VALUES (2, 3, 'e', 2, NULL);
# Proteus
INSERT INTO movingTable VALUES (21 , 22, "n", 24, NULL);
INSERT INTO movingTable VALUES (22 , 25, "s", 24, NULL);
INSERT INTO movingTable VALUES (23 , 24, "s", 22, NULL);
INSERT INTO movingTable VALUES (24 , 24, "n", 25, NULL);
INSERT INTO movingTable VALUES (25 , 23, "e", 24, NULL);
INSERT INTO movingTable VALUES (26 , 24, "w", 23, NULL);
INSERT INTO movingTable VALUES (27 , 26, "n", 23, NULL);
INSERT INTO movingTable VALUES (28 , 23, "s", 26, NULL);
INSERT INTO movingTable VALUES (29 , 21, "n", 26, NULL);
INSERT INTO movingTable VALUES (210 , 26, "s", 21, NULL);
#HIP-17710
INSERT INTO movingtable VALUES (31, 37, 'n', 33, NULL);
INSERT INTO movingtable VALUES (32, 33, 's', 37, NULL);
INSERT INTO movingtable VALUES (33, 38, 'e', 33, NULL);
INSERT INTO movingtable VALUES (34, 33, 'w', 38, NULL);
INSERT INTO movingtable VALUES (35, 39, 'n', 38, NULL);
INSERT INTO movingtable VALUES (36, 38, 's', 39, NULL);
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
INSERT INTO movingtable VALUES (417, 49, 'n', 48, NULL);
INSERT INTO movingtable VALUES (418, 48, 's', 49, NULL);
INSERT INTO movingtable VALUES (419, 410, 'e', 49, NULL);
INSERT INTO movingtable VALUES (420, 412, 'w', 49, NULL);
INSERT INTO movingtable VALUES (421, 49, 'w', 410, NULL);
INSERT INTO movingtable VALUES (422, 411, 'e', 410, NULL);
INSERT INTO movingtable VALUES (423, 410, 'w', 411, NULL);
INSERT INTO movingtable VALUES (424, 49, 'e', 412, NULL);
INSERT INTO movingtable VALUES (425, 413, 'w', 412, NULL);
INSERT INTO movingtable VALUES (426, 412, 'e', 413, NULL);
INSERT INTO movingtable VALUES (427, 414, 'n', 413, NULL);
INSERT INTO movingtable VALUES (428, 413, 's', 414, NULL);


# itemID , name , description , #weight , playerID , objectID , #groupID , resultID , actionID
# home-planet
INSERT INTO item VALUES (1, 'drivers-license', 'Its an ordinary drives license nothing more', 1, NULL, 1, NULL, NULL, 6);
INSERT INTO item VALUES (2, 'starchip-key-card', 'Old dusty starchip key card for your poorly fitted space ship.', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (3, 'clothes', 'These are your clothes, nothing special about them.', 5, NULL, 3, NULL, NULL, NULL);
INSERT INTO item VALUES (4, 'banana', 'Even tough the food store broke the banana that popped out looks edible', 2, NULL, 7, NULL, NULL, 7);
INSERT INTO item VALUES (5, 'banana-peel', 'its a banana peel, very slipery if you step on it.', 1, NULL, NULL, NULL, NULL, NULL);

#Proteus
INSERT INTO item VALUES (21, 'engine-parts', 'Its a part for you ship.', 1, NULL, 228, 277, NULL, NULL);
INSERT INTO item VALUES (22, 'tools', 'Its a special engine tools, combine it with you parts.', 1, NULL, 231, 277, NULL, NULL);
INSERT INTO item VALUES (288, 'new-engine', 'Its a new engine for you starship, use it to starship.', 1, NULL, 231, NULL, NULL, NULL);
INSERT INTO item VALUES (23, 'key', 'Its a key from Pizza-hat door.', 1, NULL, 231, NULL, NULL, NULL);
#HIP-17710
INSERT INTO item VALUES (31, 'domestic-pet', "It's round six big eyes stare at you. You are not quite sure if it's cute or terrifying", 5, NULL, 31, 31, NULL, 31);
INSERT INTO item VALUES (32, 'quantum-Flux', "Strange running substance, not like anything you have seen before.", 1, NULL, 32, 32, NULL, NULL);
INSERT INTO item VALUES (33, 'note', "Strange note that has numbers writen on it: '-1/12'", 0, NULL, 34, NULL, NULL, NULL);
INSERT INTO item VALUES (34, 'intergalactic', "A 'beer' suitable for almost any species in this galaxy.", 1, NULL, NULL, 31, NULL, NULL);
INSERT INTO item VALUES (35, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", 1, NULL, NULL, 31, NULL, NULL);
INSERT INTO item VALUES (36, 'brown-jelly', "A mixture of Intergalactic and HIPA-17710. Digesting this will surely result in timetravel.", 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (37, 'glowing-vial', "Glows with a faint blue light, might be radioactive.", 1, NULL, NULL, 32, NULL, NULL);
INSERT INTO item VALUES (38, 'vial-with-Quantum-flux', "Now glows even brighter. Definitely radioactive.", 2, NULL, NULL, 33, NULL, NULL);
INSERT INTO item VALUES (39, 'alien-fuel', "High power fuel for space ships.", 1, NULL, NULL, NULL, NULL, NULL);
# Cernobog
INSERT INTO item VALUES (41, 'pizza-dough', 'From this pizza dough yuo can make a good pizza', 2, NULL, 44, 41, 45, 42);
INSERT INTO item VALUES (42, 'alien-mushroom', 'Looks almost like normal mushrooms, but they smell like your socks.', 1, NULL, 43, 41, 45, 42);
INSERT INTO item VALUES (43, 'alien-cheese', 'Looks like normal cheese, exept its blue.', 5, NULL, 42, 41, 45, 42);
INSERT INTO item VALUES (44, 'alien-meat', 'Its meat, thats all.', 5, NULL, 42, 41, 45, 42);
INSERT INTO item VALUES (45, 'raw-pizza', 'Looks good but its still raw.', 5, NULL, NULL, 42, 46, 43);
INSERT INTO item VALUES (46, 'pizza', 'Freshly made pizza, its smells a bit odd.', 5, NULL, NULL, 43, 49, 44);
INSERT INTO item VALUES (47, 'lethal-poison-3000', 'What ever you do whit it, dont f***ing drink it, dont even smell it, just by looking it hurts. So did you get the point? I hope so...', 3, NULL, 45, 43, 49, 44);
INSERT INTO item VALUES (48, 'hulk-potion', 'A little bottle whit hulk potion labeled in it, no idea what it means.', 4, NULL, NULL, NULL, NULL, 44);
INSERT INTO item VALUES (49, 'poison-pizza-3000', 'It looks suprisingly good and smell really good, even tough it will kill you the second your lips touch it.', 6, NULL, NULL, 42, 46, 45);
INSERT INTO item VALUES (410, 'dungeon-key-card', 'A key card to the dungeon where the princess is probably kept.', 1, NULL, 49, NULL, NULL, NULL);