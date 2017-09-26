INSERT INTO planet VALUES (1, 'Home planet', 'I live here');
INSERT INTO planet VALUES (2, 'Proteus planet-1', 'Deserted planet');
INSERT INTO planet VALUES (3, 'Proteus planet-2', );

INSERT INTO itemgroup VALUES (1, 10);
INSERT INTO itemgroup VALUES (2, 11);
INSERT INTO itemgroup VALUES (3, 12);

INSERT INTO actiontable VALUES (1, 'You opened THE DOOR... concrats.');
INSERT INTO actiontable VALUES (2, 'you read your email... you tougth that id tell you whats in it... Well... Okay just this once.');

INSERT INTO place VALUES (1, 'Home', 'Its your home and as you look around you can see small bed,shower, table, computer and cloths lying on the floor (you migth want to wear them.)', 1);
INSERT INTO place VALUES (2, 'Goverment building', 'Nothing special here its just a giant hall for fancy people', 1);
INSERT INTO place VALUES (3, 'Poorly fitted space ship', 'This ship has seen better days. its inside out full of rust and couple of holes here and there. Its just a miracle that this ship can even fly...', 1);
INSERT INTO place VALUES (4, 'Landing zone in proteus planet-1', 'Where ever you look you cant see anything of interest, this planet is completly deserted.', 2);

INSERT INTO movingtable VALUES (1, 2, 'W', 1);
INSERT INTO movingtable VALUES (2, 3, 'W', 2);

INSERT INTO player VALUES (1, 0, 80, 1);

INSERT INTO objecttype VALUES (1, 'Door');
INSERT INTO objecttype VALUES (2, 'Button');

INSERT INTO object VALUES (1, 'Table', 'Its just a table', 1, NULL, NULL);
INSERT INTO object VALUES (2, 'Door', 'Ordinary door, what did you expect?', 1, 1, 1);
INSERT INTO object VALUES (3, 'Floor', 'The floor of your home, it has a nice pattern in it.', 1, NULL, NULL);
INSERT INTO object VALUES (4, 'Shower', 'Shower that looks like its havent been used in ages...', 1, 1, NULL);
INSERT INTO object VALUES (5, 'Computer', 'A computer which is in pretty good shape. It seems that you have a new email for you.', 1, 1, NULL, 2);
INSERT INTO object values (6, '')

INSERT INTO item VALUES (1, 'Its an ordinary drives license nothing more', 1, 'Drivers lisense', NULL, 1, NULL, NULL);
INSERT INTO item VALUES (2, 'Old dusty starchip key card for your poorly fitted space ship.', 1, 'Starchip key card', NULL, NULL, NULL, NULL);
INSERT INTO item VALUES (3, 'These are your clothes, nothing special about them.', 5, 'Clothes', NULL, 3, NULL, NULL);
