INSERT INTO planet VALUES (1, "Mars 39", "Mars 39 is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (2, "React", "React 39 is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (2, "MjolnerX", "MjolnerX is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (4, "Faringate", "Its a lethal planet");
INSERT INTO planet VALUES (5, "RockScorp", "RockScorp is a small palnet in Proteus. There is a small shop, front gate, proteus landing and pizza-hat.");
INSERT INTO planet VALUES (6, "Marian", "Its a lethal planet");


INSERT INTO place VALUES (1,"Shop", "In the shop you can to buy all what you need, from food to engine parts", 1);
INSERT INTO place VALUES (2,"Front Gate", "descriptions", 1);
INSERT INTO place VALUES (3,"Sewer entrance", "descriptions", 1);
INSERT INTO place VALUES (4,"Proteus Landing", "descriptions", 1);
INSERT INTO place VALUES (5,"Pizza-hat", "descriptions", 1);
INSERT INTO place VALUES (6,"Sewer", "descriptions", 1);

INSERT INTO movingTable VALUES (1 , 2, "n", 4);
INSERT INTO movingTable VALUES (2 , 5, "s", 4);
INSERT INTO movingTable VALUES (3 , 4, "s", 2);
INSERT INTO movingTable VALUES (4 , 4, "n", 5);

INSERT INTO movingTable VALUES (4 , 3, "e", 4);
INSERT INTO movingTable VALUES (4 , 4, "w", 3);
INSERT INTO movingTable VALUES (4 , 6, "n", 3);
INSERT INTO movingTable VALUES (4 , 3, "s", 6);
INSERT INTO movingTable VALUES (4 , 1, "n", 6);
INSERT INTO movingTable VALUES (4 , 6, "s", 1);

INSERT INTO objecttype VALUES (1, 'Door');
INSERT INTO objecttype VALUES (2, 'Holographic device');





INSERT INTO object VALUES (1, "Pizza-hat-door", "Simple metal door", 4, 1 ,NULL, 2);
INSERT INTO object VALUES (2, "Front-Gate-door", "Simple metal door", 4, 1 ,NULL, 2);
INSERT INTO object VALUES (3, "Sewer-entrance door", "Simple metal door", 4, 1 ,NULL, 2);
INSERT INTO object VALUES (5, "Empty box", "Some box on the floor", 4, NULL ,NULL);
INSERT INTO object VALUES (6, "Floor", "Dirty floor, where is cleaner?", 4, NULL ,NULL, NULL);
INSERT INTO object VALUES (7, "Notebook", "It defenitely doesn't work.", 4, NULL ,NULL, 3);
INSERT INTO object VALUES (8, "Security", "I dont want to say nothing to him.", 4, NULL ,NULL, 4);
INSERT INTO object VALUES (9, "Starship", "Its my starship.", 4, NULL ,5);

INSERT INTO object VALUES (10, "Holographic device ", "You can use it", 2, 1 ,NULL, 1);
INSERT INTO object VALUES (11, "Proteus landing door", "Door to proteus landing place", 2, 1 ,NULL, 2);
INSERT INTO object VALUES (12, "Table", "Its just a table in the corner", 2, 1 ,NULL, 10);
INSERT INTO object VALUES (13, "Chair", "It's a old red chair", 2, 1 ,NULL, 6);
INSERT INTO object VALUES (14, "Soldier", "I dont want to speak with him", 2, 1 ,NULL, 7);
INSERT INTO object VALUES (15, "Garbage", "Garbage is garbage", 2, 1 ,NULL, NULL);


INSERT INTO actionTable VALUES(1, 'Hello men i am a halographic device');
INSERT INTO actionTable VALUES(2, 'You opened the door');
INSERT INTO actionTable VALUES(3, 'Old notebook, not interested');
INSERT INTO actionTable VALUES(4, 'I am security number 185749464.');
INSERT INTO actionTable VALUES(5, 'Go next');
INSERT INTO actionTable VALUES(6, 'No now');
INSERT INTO actionTable VALUES(7, '...');
INSERT INTO actionTable VALUES(8, 'Hello Jack i can help you to find a key, you need a....');
INSERT INTO actionTable VALUES(9, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(10, 'Yes, i want to broke it, but not now');
INSERT INTO actionTable VALUES(11, 'Hei, man it just a table');
INSERT INTO actionTable VALUES(12, 'Hello! Your starship is broken? you can find some parts in those box');
INSERT INTO actionTable VALUES(11, 'Hei, man it just a table');

INSERT INTO object VALUES (16, "Woman", "She do something, I don't understand what exactly.", 3, NULL ,8);
INSERT INTO object VALUES (17, "Sewer-door", "Door to proteus Sewer", 3, 1 ,NULL, 2);
INSERT INTO object VALUES (18, "Proteus landing door", "Door to the place where you ship", 3, 1 ,NULL, 2);
INSERT INTO object VALUES (19, "Camera", "Big brother see you.", 3, NULL ,NULL);


INSERT INTO object VALUES (20, "Ladder", "It's ladder to the shop.", 6, NULL ,NULL);
INSERT INTO object VALUES (21, "Sewer door", "Door to proteus Sewer", 6, 1 ,NULL, NULL);
INSERT INTO object VALUES (22, "Proteus-landing-door", "Door to the place where you ship", 6, 1 ,NULL, NULL);
INSERT INTO object VALUES (23, "Camera", "Big brother see you.", 6, NULL ,NULL, 10);


INSERT INTO object VALUES (25, "ladder-to-serwer", "Ladder to serwer", 1, 1 ,NULL, NULL);
INSERT INTO object VALUES (26, "seller", "Seller look like my boss", 1, 1, NULL ,12);
INSERT INTO object VALUES (27, "camera", "Big brother see you.", 1, 1, NULL ,10);
INSERT INTO object VALUES (28, "box", "In this box a lot of different parts.", 1, 1, NULL ,10);

INSERT INTO item VALUES (1, 'engine-parts', 'Its a part for you ship.', 1, NULL, 28, 77, NULL, NULL);
INSERT INTO item VALUES (2, 'tools', 'Its a special engine tools, combine it with you parts.', 1, NULL, 31, 77, NULL, NULL);
INSERT INTO item VALUES (88, 'new-engine', 'Its a new engine for you starship, use it to starship.', 1, NULL, 31, NULL, NULL, NULL);
INSERT INTO item VALUES (3, 'key', 'Its a key from Pizza-hat door.', 1, NULL, 31, NULL, NULL, NULL);



INSERT INTO itemGroup VALUES (77, 88);




INSERT INTO object VALUES (29, "Exit door", "Door to landing place", 5, NULL ,NULL, 2);
INSERT INTO object VALUES (30, "camera", "Big brother see you.", 5, NULL, NULL ,10);
INSERT INTO object VALUES (31, "table", "Big brother see you.", 5, NULL, NULL ,11);


