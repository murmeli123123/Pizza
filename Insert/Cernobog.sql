INSERT INTO planet VALUES (1, 'CERNOBOG PLANET-1', 'An icy deserted planet that has nothing in it.');
INSERT INTO planet VALUES (2, 'CERNOBOG PLANET-2', 'This planet contains the rebel forces.');
INSERT INTO planet VALUES (3, 'CERNOBOG PLANET-3', 'This planet contains the evil forces base.');




INSERT INTO place VALUES (1, 'CERNOBOG PLANET-1 LANDING ZONE', 'You cant see anything else than ice and its freaking cold out here. You better leave befor you freeze to death', 1);
INSERT INTO place VALUES (2, 'CERNOBOG PLANET-2 LANDING ZONE', 'In the west is a museum, south has a market, in east is a pizza-hat and in north has a poorly fitted space ship.', 2);
INSERT INTO place VALUES (3, 'MUSEUM', 'Strange looking things are in here, your not sure could these be called art or simply junk, but you never really understood art. In the east is a landing zone.', 2);
INSERT INTO place VALUES (4, 'MARKET', 'Here are some really strange things being sold, you cant even tell what they are. In the north is the landing zone and in east is a pharmacy.', 2);
INSERT INTO place VALUES (5, 'PIZZA-HAT', 'It seems that where ever you go, there is going to be pizza-hat in it. you cant escape your fate of beeing pizza delivery boy to the rest of your life. In the west is a landing zone.', 2);
INSERT INTO place VALUES (6, 'PHARMACY', 'Its a basic looking pharmacy, here is your everyday medicine sold as well as something that should not be sold in here. In west is a market.', 2);
INSERT INTO place VALUES (7, 'CERNOBOG PLANET-3 LANDING ZONE', 'You see a huge gate in north which lead to a mansion, that must be where the evil forces are keeping the princess. In south is a poorly fitted space ship', 3);
INSERT INTO place VALUES (8, 'GATE TO MANSION', 'A huge gate which leads to a mansion in north and in south is a landing zone.', 3);
INSERT INTO place VALUES (9, 'LOUNGE', 'A big lounge which has entryes to east hallway and west hallway.', 3);
INSERT INTO place VALUES (10, 'EAST HALLWAY', 'Long hallway which has many doors in it, all of them seems to be locked. In the east side of hallway is a east wing and in west is lounge.', 3);
INSERT INTO place VALUES (11, 'EAST WING', 'Seems to be a living quater for guards. In the west is a east hallway.', 3);
INSERT INTO place VALUES (12, 'WEST HALLWAY', 'Long hallway Which has many doors in it, all of them seems to be locked. In the west side of hallway is a west wing and in east is lounge.', 3);
INSERT INTO place VALUES (13, 'WEST WING', 'Here seems to be three doors, all of them are locked. One of the doors got lable dungeon in it, perhaps the princess is kept in there. In the nort is a dungeon and in east is a west hallway.', 3);
INSERT INTO place VALUES (14, 'DUNGEON', 'Basic dungeon', 3);

INSERT INTO itemgroup VALUES (1, 5);
INSERT INTO itemgroup VALUES (2, 6);
INSERT INTO itemgroup VALUES (3, 9);

INSERT INTO actiontable VALUES (1, 'You go into a toilet. As you are doing you business, you see a note laying on the ground. you take the note and finnish your busines and leave.');
INSERT INTO actiontable VALUES (2, 'You combine all the pizza ingredients.');
INSERT INTO actiontable VALUES (3, 'You put the raw pizza in the oven. after a while you take the pizza out and now you have a frehly made pizza whit you.');
INSERT INTO actiontable VALUES (4, 'You combine the pizza whit lethal poison 3000.');
INSERT INTO actiontable VALUES (5, 'You press the doorbell after a while guard comes and asks you what do you want. You give him the poison pizza 3000 and you say that somebody ordered pizza to be delivered here. Guard takes the pizza, he thanks you and leaves. After that you can hear the guard yelling "Boys looks like we have some pizza to breakfast."');

INSERT INTO objecttype VALUES (1, 'DOOR');
INSERT INTO objecttype VALUES (2, 'BUTTON');
INSERT INTO objecttype VALUES (3, 'HATCH');
INSERT INTO objecttype VALUES (4, 'OVEN');

INSERT INTO object VALUES (1, 'TOILET', 'Its a toilet, nothing more about that', 3, 1, NULL, 1);
INSERT INTO object VALUES (2, 'COLD POOL', 'Its used to keep food fresh, there seems to be some tasty looking things.', 4, 1, 3, NULL);
INSERT INTO object VALUES (3, 'VEGETABLE SHELF', 'Here seems to be all kinds of vegetables.', 4, 1, 3, NULL);
INSERT INTO object VALUES (4, 'DRY FOOD SHELF', 'Its full of dry food ingredients.', 4, 1, 3, NULL);
INSERT INTO object VALUES (5, 'DRUG SHELF', 'Its full of all kinds of drugs', 6, 1, 3, NULL);
INSERT INTO object VALUES (6, 'PIZZA OVEN', 'Its used to make delicios pizzas', 5, 1, 4, NULL);
INSERT INTO object VALUES (7, 'GATE', 'Its really big gate', 8, 1, 1, NULL);
INSERT INTO object VALUES (8, 'DOORBELL', 'Its a white button that rings a doorbell.', 8, 1, 2, 5);
INSERT INTO object VALUES (9, 'FALLEN GUARD', 'Seem like the pizza did its job.', 11, 1, NULL, NULL);
INSERT INTO object VALUES (10, 'DUNGEON DOOR', 'Its a door to the dungeon.', 13, 1, NULL, NULL);

INSERT INTO item VALUES (1, 'PIZZA DOUGH', 'From this pizza dough yuo can make a good pizza', 2, NULL, 4, 1, 5, 2);
INSERT INTO item VALUES (2, 'ALIEN MUSHROOMS', 'Looks almost like normal mushrooms, but they smell like your socks.', 1, NULL, 3, 1, 5, 2);
INSERT INTO item VALUES (3, 'ALIEN CHEESE', 'Looks like normal cheese, exept its blue.', 5, NULL, 2, 1, 5, 2);
INSERT INTO item VALUES (4, 'ALIEN MEAT', 'Its meat, thats all.', 5, NULL, 2, 1, 5, 2);
INSERT INTO item VALUES (5, 'RAW PIZZA', 'Looks good but its still raw.', 5, NULL, NULL, 2, 6, 3);
INSERT INTO item VALUES (6, 'PIZZA', 'Freshly made pizza, its smells a bit odd.', 5, NULL, NULL, 3, 9, 4);
INSERT INTO item VALUES (7, 'LETHAL POISON 3000', 'What ever you do whit it, dont f***ing drink it, dont even smell it, just by looking it hurts. So did you get the point? I hope so.', 3, NULL, 5, 3, 9, 4);
INSERT INTO item VALUES (8, 'HULK POTION', 'A little bottle whit hulk potion labeled in it, no idea what it means.', 4, NULL, NULL, NULL, NULL, 4);
INSERT INTO item VALUES (9, 'POISON PIZZA 3000', 'It looks suprisingly good and smell really good, even tough it will kill you the second your lips touch it.', 6, NULL, NULL, 2, 6, 5);
INSERT INTO item VALUES (10, 'DUNGEON KEY CARD', 'A key card to the dungeon where the princess is probably kept.', 1, NULL, 9, NULL, NULL, NULL);
