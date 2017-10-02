import mysql.connector


db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)


# db = mysql.connector.connect(host = "localhost",/Users/andrei/Documents/home_works/Coding/PYTHON/Pizza/Peli.py
#                                 port="4444",
#                               user = "andreiva",
#                               passwd = "root",
#                               db = "andreiva",
#                               buffered = True)

cur = db.cursor()

#main function is a game core!! Function call on the end of code!

def main():
  # Initialize player location

    location = "something location"
    action = ""
                            # location is current location
                            # command is action verb
                            # target object
    cur = db.cursor()
    while action!="quit" and location!="EXIT":

        input_command=input("> ").split()

        if len(input_command) >= 1:
            action = input_command[0].lower()
        else:
            action = ""
        if len(input_command) >= 2:
            target = input_command[len(input_command)-1].lower() #lower make the string to lowercase
        else:
            target = ""


        if action == "get":
            if target!="":
                getFunc(target)
            else:
              print("It's just a verb!, Try again!")

        elif action == "drop":
            if target!="":
                dropfunc(target)
            else:
                print("It's just a verb!, Try again!")
        elif action == "i":
            inventoryfunc()
        #
        # elif action == "combine":
        #     combFunc(input_command)
        #
        # elif action == "look":
        #     lookaroundfunc()

        elif action == "show":
            if target != "":
                showitemfunc(target)
            else:
                lookaroundfunc()

        elif action == "n" or 's' or 'w' or 'e':
            movefunc(action)

        else:
            print("I dont understand this command")


def showitemfunc(target):

    try:
        cur.execute("SELECT objectID, description \
        FROM object, player WHERE player.placeID = object.placeID AND object.name = '%s';" % (target))
        item_desc = cur.fetchall()
        #
        cur.execute("SELECT name, description FROM item WHERE objectID = '%i';" % item_desc[0][0])
        items = cur.fetchall()
    except IndexError:
        print("This place dont't contain this object")
    else:

        print("Ihis object contain some objests, input 'get' + object, if you want to get it")
        for i in items:
            print("| " + i[0] + " |",end=" : ")
            print(i[1])
        print(item_desc[0][1])






def lookaroundfunc():
    cur.execute("SELECT place.description, player.placeID FROM place, player WHERE player.placeID = place.placeID;")
    rez = cur.fetchall()
    print(rez[0][0])
    print(rez[0][1])

    cur.execute("SELECT name FROM object WHERE object.placeID = '%i';" % (rez[0][1]))
    objects = cur.fetchall()
    print("In this place are: ", end=" ")
    for i in objects:
        print(i[0], end=" | ")
    print()
    print("Input 'show' and objcet, if you want to see it.")



def movefunc(dist):
    cur.execute("SELECT placeID FROM player;")
    player_placeid = cur.fetchall()[0][0]

    try:
        cur.execute("SELECT whereTo FROM movingtable WHERE placeID = '%i' AND \
    	       direction = '%s';" % (player_placeid, dist))
        rez = cur.fetchall()[0][0]
        
    except IndexError:
        print("you can't go there!")
    else:
        cur.execute("UPDATE player SET placeID = %i WHERE player.playerID = 1" % (rez))
        cur.execute("SELECT name FROM place WHERE placeID = '%i'" % (rez))
        new_place_name = cur.fetchall()[0][0]
        print("Your lacation is: " + new_place_name)


def inventoryfunc():
    cur.execute("SELECT name FROM item WHERE playerID = 1;")
    all_items = cur.fetchall()
    print("In you inventory :", end=" ")
    for i in all_items:
        print(" | " + i[0] + " | ", end=" ")
    print()




def dropfunc(target):
    cur.execute("SELECT name FROM item WHERE playerID = 1;")
    all_items = cur.fetchall()
    item_list = []
    for i in all_items:
        item_list.append(*i)

    cur.execute("SELECT name FROM item WHERE playerID = 1;")


    if target in item_list:
        cur.execute("SELECT itemID FROM item WHERE name = '%s';" % (target))
        item_name = cur.fetchall()[0][0]
        cur.execute("UPDATE item SET playerID = NULL WHERE itemID = '%i'  " % (item_name))
        print("You dropped " + target)
    else:
        print("Item not found in your inventory!")


def getFunc(target):
    cur.execute("SELECT placeID FROM player;")
    player_placeid = cur.fetchall()

    sql = "SELECT item.name FROM item, object \
    WHERE item.objectID = object.objectID AND object.placeID = '%i'" % (player_placeid[0][0])
    cur.execute(sql)
    item_list = cur.fetchall()

    ilist = []   #new list for items

    for i in item_list:
        ilist.append(*i)   #append all items to list

    if target in ilist:
        cur.execute("SELECT itemID FROM item WHERE name = '%s';" % (target))
        target_item_id = cur.fetchall()[0][0]

        cur.execute("SELECT playerID FROM item WHERE name = '%s';" % (target))
        player_id = cur.fetchall()[0][0]

        if player_id != 1:
            cur.execute("UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (target_item_id))
            print( target + " in your inventory")
        else:
            print("This item is already in your inventory")
    else:
        print("This item not founded")























main()
