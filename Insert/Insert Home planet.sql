INSERT INTO planet VALUES (1, 'HOME PLANET', 'You live here');

INSERT INTO itemgroup VALUES (1, 10);
INSERT INTO itemgroup VALUES (2, 11);
INSERT INTO itemgroup VALUES (3, 12);

INSERT INTO actiontable VALUES (1, 'You opened THE DOOR... congrats.');
INSERT INTO actiontable VALUES (2, 'You read your email... you tougth that id tell you whats in it... Well... Okay just this once.');
INSERT INTO actiontable VALUES (3, 'As you go into shower and star to feel like your life is being drained away. When you open the faucet and water comes down to you, you star to feel like your skin is melting away and you start to panick, you slip down and you hit your head... You are dead');
INSERT INTO actiontable VALUES (4, 'You press the button in food store, it makes little explosion and pops a banana out. After that it breaks down and starts to smoke. Great now you have to fix it');
INSERT INTO actiontable VALUES (5, 'You press the button and nothing happens... You tougth that if you press the button it will work agian didnt you?');
INSERT INTO actiontable VALUES (6, '')

INSERT INTO place VALUES (1, 'HOME', 'Its your home and as you look around you can see door located in east, small bed, food store, shower, table, computer and cloths lying on the floor (you migth want to wear them.)', 1);
INSERT INTO place VALUES (2, 'GOVERMENT BUILDING', 'Nothing special here its just a giant hall for fancy people. The agents seems to wait at the door in east', 1);
INSERT INTO place VALUES (3, 'POORLY FITTED SPACE SHIP', 'This ship has seen better days. Its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 1);
INSERT INTO place VALUES (4, 'CONTROL ROOM', 'Everything inside the space ship looks outdated. Here is a control panel whit some old buttons in it also next to it is a giant red button. And in south is a gargo room.', 1);

INSERT INTO movingtable VALUES (1, 2, 'E', 1);
INSERT INTO movingtable VALUES (2, 3, 'E', 2);

INSERT INTO player VALUES (1, 0, 80, 1);

INSERT INTO objecttype VALUES (1, 'DOOR');
INSERT INTO objecttype VALUES (2, 'BUTTON');

INSERT INTO object VALUES (1, 'TABLE', 'Its just a table', 1, NULL, NULL, NULL);
INSERT INTO object VALUES (2, 'DOOR', 'Ordinary door, what did you expect?', 1, 1, 1, NULL);
INSERT INTO object VALUES (3, 'FLOOR', 'The floor of your home, it has a nice pattern in it.', 1, NULL, NULL, NULL);
INSERT INTO object VALUES (4, 'SHOWER', 'Shower that looks like its havent been used in ages...', 1, 1, NULL, NULL);
INSERT INTO object VALUES (5, 'COMPUTER', 'A computer which is in pretty good shape. It seems that you have a new email for you.', 1, 1, NULL, 2);
INSERT INTO object VALUES (6, 'FOOD STORE', 'Its a food store, here you can buy food and its deliverd into this device instantly. It has a button on it', 1, 1, 2, 4);
INSERT INTO object VALUES (7, 'BROKEN FOOD STORE', 'Its broken and it smokes.', NULL, 1, 2, 5);
INSERT INTO object VALUES (8, 'SMALL BED', 'Its a one person bed', 1, NULL, NULL, NULL);

INSERT INTO item VALUES (1, 'DRIVERS LICENSE', 'Its an ordinary drives license nothing more', 1, NULL, 1, NULL, NULL, 6);
INSERT INTO item VALUES (2, 'STARCHIP KEY CARD', 'Old dusty starchip key card for your poorly fitted space ship.', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (3, 'CLOTHES', 'These are your clothes, nothing special about them.', 5, NULL, 3, NULL, NULL, NULL);
INSERT INTO item VALUES (4, 'BANANA', 'Even tough the food store broke the banana that popped out looks edible', 2, NULL, 7, NULL, NULL, NULL);
