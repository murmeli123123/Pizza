# Insert script for HIP-17710
# planetID , name , description
INSERT INTO planet VALUES (21, 'HIP-17710 Planet 1','This planet seems deserted');
INSERT INTO planet VALUES (22, 'HIP-17710 Planet 2','A rocky planet with fiery winds.');
INSERT INTO planet VALUES (23, 'HIP-17710 Planet 3','Small watery planet. This is the main living place for habitants of HIP-17710 system.');

#placeID , name , description , placeID
INSERT INTO place VALUES (21, 'intergalactic-refueling-station', "This fueling station orbits the system at a close distance. The public transportation system can be used to travel to the other planets. They also sell all kinds of alien grocerys", NULL);
INSERT INTO place VALUES (22, 'landing-Zone', "This is the landing zone of planet 1. The sandy dunes seem to continue to the horizon and it's unlikely there is anything useful here", 21);
INSERT INTO place VALUES (23, 'landing-Zone', "This is the landing zone of planet 2. Looking West you can see some kind of alien residence. To the East of you there is an alien business that seems to be out of order.", 22);
INSERT INTO place VALUES (24, 'landing-Zone', "This is the landing zone of planet 3. A beatiful landscape opens beneath your eyes. You can see the endless sea infront of you as the ocean breeze whisks your face. Looking East you see a colorful boulevard with high rise buildings. To your North there is a shop that is equipped with the same company logo as yours, but you are not quite sure about the spelling..", 23);
INSERT INTO place VALUES (25, 'alien-business', "Sand dust and some planks covers the windows so you can't see inside of it. South of you there seems to be a way to get to the backyard.", 22);
INSERT INTO place VALUES (26, 'backyard', "Filled with metallic containers, propably some kind of dumpster. You can hear something scratching inside one of the containers.", 22);
INSERT INTO place VALUES (27, 'pizza-Hat-alley', "Familiar smell hits your nose upon entering the alley. It is no doubt a Pizza-Hat restaurant. You had no idea they had a restaurant at HIP-17710.", 23);
INSERT INTO place VALUES (28, 'boulevard', "A beatiful boulevard with high rise buildings. At the North end of the boulevard you can see the intergalactic sign for a bar and an ID of 36.", 23);
INSERT INTO place VALUES (29, 'bar-id:36', "This seems to be the go to place in HIP-17710. Someone hands you a flyer at the door written in native earth human language. 'Hjyvä bari hjyvä juoma.' You have no idea what it says. They sell all kinds of drinks from beer to alien extract.", 23);
INSERT INTO place VALUES (210, 'alien-residence', "Some living creature is walking around the building looking for something",22);

# moveID , whereTo , direction , placeID
INSERT INTO movingtable VALUES (21, 27, 'n', 23);
INSERT INTO movingtable VALUES (22, 23, 's', 27);
INSERT INTO movingtable VALUES (23, 28, 'e', 23);
INSERT INTO movingtable VALUES (24, 23, 'w', 28);
INSERT INTO movingtable VALUES (25, 29, 'n', 28);
INSERT INTO movingtable VALUES (26, 28, 's', 29);

# actionID , description
INSERT INTO actiontable VALUES (21, "As Jack approaches, it makes some kind of growling noice but doesn't seem to be reluctant.");
INSERT INTO actiontable VALUES (22, "Jack opens the box and sees a note in it.");

# typeID , typename
INSERT INTO objecttype VALUES (21, 'dumpster');
INSERT INTO objecttype VALUES (22, 'box');

# gourpID , resultID
INSERT INTO itemGroup VALUES (21, 26);
INSERT INTO itemGroup VALUES (22, 28);
INSERT INTO itemGroup VALUES (23, 210);

# objectID , name , description , placeID , usable , typeID , actionID
INSERT INTO object VALUES (21, 'dumpster', "A heavy metallic container with a stained smell near it. Something living is making noices inside it.", 21, 1, NULL, NULL);
INSERT INTO object VALUES (22, 'stranger', "It seems to be looking for something.", 210, NULL, NULL, NULL);
INSERT INTO object VALUES (23, 'closed-pizza-box', "Dirty and soggy, looks discusting.", 27, 1, 22, 22);
INSERT INTO object VALUES (24, 'opened-pizza-box', "Dirty and soggy, looks discusting. A note is lying on it.", 27, NULL, 22, NULL);


# itemID , name , description , #weight , playerID , objectID , #gourpID , resultID , actionID
INSERT INTO item VALUES (21, 'domestic-pet', "It's round six big eyes stare at you. You are not quite sure if it's cute or terrifying", 5, NULL, 21, 21, NULL, 21);
INSERT INTO item VALUES (22, 'quantum-Flux', "Strange running substance, not like anything you have seen before.", 1, NULL, 22, 22, NULL, NULL);
INSERT INTO item VALUES (23, 'note', "Strange note that has numbers writen on it: '-1/12'", 0, NULL, 24, NULL, NULL, NULL);
INSERT INTO item VALUES (24, 'intergalactic', "A 'beer' suitable for almost any species in this galaxy.", 1, NULL, NULL, 21, NULL, NULL);
INSERT INTO item VALUES (25, 'hipa-17710', "Unique craft beer of HIP-17710. It has not been tested with earth humans before.", 1, NULL, NULL, 21, NULL, NULL);
INSERT INTO item VALUES (26, 'brown-jelly', "A mixture of Intergalactic and HIPA-17710. Digesting this will surely result in timetravel.", 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (27, 'glowing-vial', "Glows with a faint blue light, might be radioactive.", 1, NULL, NULL, 22, NULL, NULL);
INSERT INTO item VALUES (28, 'vial-with-Quantum-flux', "Now glows even brighter. Definitely radioactive.", 2, NULL, NULL, 23, NULL, NULL);
INSERT INTO item VALUES (29, 'alien-fuel', "High power fuel for space ships.", 1, NULL, NULL, NULL, NULL, NULL);
