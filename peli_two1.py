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
    location = ""
    action = ""
                            # command is action verb
                            # target object

    while action!="quit" and location!="EXIT":
        location = getLocName()        # location is current location
        locationID = getLocID()


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
        elif action == "combine":
            combFunc(input_command)

        # elif action == "look":
        #     lookaroundfunc()

        elif action == "open":   # open object
            if target != '':
                if len(input_command) == 3:
                    objectname = input_command[1]
                    openFunc(getLocID(),target,objectname)
                else:
                    openFunc(getLocID(), target)
            else:
                print("Try again")

        elif action == "use":  # Use objects
            if target != '':
                useFunc(target, locationID)

        elif action == "press":
            if target != '':
                pressFunc(target)

        elif action == "show":
            if target != "":
                showitemfunc(target)
            else:
                lookaroundfunc()

        elif action == "n" or action == 's' or action == 'w' or action == 'e':
            movefunc(action)

        elif action == 'map':
            getmap()

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
        cur.execute("SELECT whereTo, objectID FROM movingtable WHERE placeID = '%i' AND \
    	       direction = '%s';" % (player_placeid, dist))
        rez = cur.fetchall()
        whereTo = rez[0][0]
        objectID = rez[0][1]

    except IndexError:
        print("you can't go there!")
    else:
        if objectID != None:
            cur.execute("SELECT locked, name FROM object WHERE ObjectID = '%i';" % objectID)
            rez = cur.fetchall()
            locked = rez[0][0]
            name = rez[0][1]
            if locked == 1:
                print("You can't go there. A " + name + " is blocking the way")
                return
        cur.execute("UPDATE player SET placeID = %i WHERE player.playerID = 1" % (whereTo))
        cur.execute("SELECT name FROM place WHERE placeID = '%i'" % (whereTo))
        new_place_name = cur.fetchall()[0][0]
        print("Your location is: " + new_place_name)


def inventoryfunc():
    cur.execute("SELECT name FROM item WHERE playerID = 1;")
    all_items = cur.fetchall()
    print("In you inventory :", end=" ")
    for i in all_items:
        print(" | " + i[0] + " | ", end=" ")
    print()

def getAction(Id, Req): # For getting actions, Req 0 = Object, Req 1 = Item
    Type = ''           # Id is the id of object or item

    if Req == 0:
        Type = 'Object'
    elif Req == 1:
        Type = 'Item'

    sql = "SELECT actiontable.description FROM actiontable \
            JOIN %s \
            WHERE actiontable.actionID = %s.actionID \
            AND %s.%sID = %i " % (Type, Type, Type, Type, Id)
    try:
        cur.execute(sql)
        result = cur.fetchall()
        return result[[0][0]]
    except IndexError:
        return None

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

        action = getAction(target_item_id, 1)
        if action != None:
            cur.execute(action[0])

        if player_id != 1:
            cur.execute("UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (target_item_id))
            print( target + " in your inventory") #playerID = 1
            cur.execute("UPDATE item SET objectID = NULL WHERE itemID = '%i'" % (target_item_id))
            print( target + " in your inventory") #objectID = NULL
        else:
            print("This item is already in your inventory")
    else:
        print("This item not founded")

def getLocName():
    sql = "SELECT place.name \
            FROM place join player \
            WHERE place.placeID = player.placeID"
    cur.execute(sql)
    result = cur.fetchall()
    return(result[0][0])

def getLocID():
    sql = "SELECT player.placeID \
            FROM player"
    cur.execute(sql)
    result = cur.fetchall()
    return(result[0][0])


def openFunc(loc, request, *objectname):

    multiple = 'There is multiple objects:'     # String for multiple objects
    y = 0       # Used for counting
    objectID = None # object.objectID
    objectType = getObjectType(request, loc) # objecttype.typeID
    action = None # actiontable.actionID

    if objectType != None: # if objectType has been initialized get results
        sql = "SELECT object.objectID, object.name, objecttype.typename, object.actionID, object.usable \
                FROM objecttype join object \
                WHERE object.typeID = objecttype.typeID and object.placeID = %i and objecttype.typeID = %i" % (loc, objectType)
        cur.execute(sql)
        result = cur.fetchall()
    else:
        print("You can't do that!")
        return

    if objectname != ():    # If objectname is given
        objectname = ''.join(objectname) # Make it into string
        for x in result:
            if objectname == x[1] and x[4] == 1: # If objectname matches and
                objectID = x[0]               # is usable -> Set objectID.
                action = getAction(objectID, 0)   # Get actions
        if objectID == None:    #If no objectID was stored
            print("You can't do that!")
        elif action == None and objectID != None: #If objectID was found and no action
            print("Jack opens the " + objectname + ' ' + request)
            sql = "UPDATE object SET locked = 0 WHERE object.objectID = %i;" % objectID
            cur.execute(sql)
            return

    elif len(result) > 1:   # If there is multiple objects
        for x in result:
            y += 1  # start the counter
            multiple += ' ' + x[1] + ' ' + x[2] # Add to the string
            if y != len(result):        # While y is smaller than lenght of result
                multiple += ','      # add a comma
        print(multiple)
        return

    elif len(result) == 1 : # If there is only one result
        if result[0][4] == 1:   # If it's usable
            action = getAction(result[0][0], 0) # Get actions
            objectname = result[0][2]       # Set objectname
            objectID = result[0][0]
        else:
            print("The "+ result[0][1] + " is not usable")

    if action != None: # If there is actions
        print(action[0])
    elif action == None and request == objectname:
        print("Jack opens the " + objectname)
        sql = "UPDATE object SET locked = 0 WHERE object.objectID = %i;" % objectID
        cur.execute(sql)


def getObjectType(request, loc): # Getting the objecttype.typeID
    typename = request
    sql = "SELECT objecttype.typename, object.typeID \
            FROM objecttype join object \
            WHERE objecttype.typename = '%s' and objecttype.typeID = object.typeID and object.placeID = %i" % (typename, loc)
    cur.execute(sql)
    result = cur.fetchall()
    for x in result:
        if typename == x[0]:
            return x[1]

def useFunc(target, locID):
    try:
        cur.execute("SELECT object.name, object.actionID, object.objectID FROM object WHERE name = '%s' and placeID = '%i' " % (target, locID))
        result = cur.fetchall()
        if result[0][1] != None:
            print(getAction(result[0][2], 0)[0])
        else:
            print("You can't use that!")
    except:
        print("You can't use that!")

def pressFunc(target):
    pass

def getmap():
    # Kartan malli
    def mapbase():
        base = list(" _______\n|\t|\n|\t|\n|_______|")
        return base

    # Ilmansuunnat Minne pelaaja voi mennä olemastaan ruudusta
    def moving():
        sql = "SELECT movingTable.direction \
                FROM player, place, movingTable \
                WHERE player.placeID = place.placeID \
                AND place.placeID = movingTable.placeID"
        cur.execute(sql)
        move = cur.fetchall()
        movements = str(move)
        return movements

    # Kartta siitä ruudusta missä pelaaja on
    def currentmap():
        base = mapbase()
        movements = moving()
        for x in movements:
            if x == "n":
                base[4] = "n"
            elif x == "w":
                base[13] = "w"
            elif x == "e":
                base[15] = "e"
            elif x == "s":
                base[21] = "s"
        for x in base:
            print(x, end='')
        print('\n')

    currentmap()






def combFunc(input_command):

    if len(input_command) >= 3:

        item_one = input_command[1].lower()
        item_two = input_command[len(input_command)-1].lower()
        # if len(input_command) >= 3:

        count = 0
        cur = db.cursor()
        sql = "SELECT name FROM item WHERE playerID = 1 and groupID > 0"
        cur.execute(sql)
        itemrez = cur.fetchall()
        for i in itemrez:

            if i[0] == item_one or i[0] == item_two:
                count = count + 1

        if count == 2:
            cur = db.cursor()
            sql = "SELECT groupID FROM item WHERE name = '%s' or name = '%s'" % (item_one, item_two)
            cur.execute(sql)
            result = cur.fetchall()

            if result[0][0] == result[1][0]:
                print(result[0][0])
                print(result[1][0])
                cur = db.cursor()
                sql = "UPDATE item SET playerID = NULL WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)

                cur = db.cursor()
                sql =  "SELECT resultID FROM item WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)
                groupid = cur.fetchall()

                cur = db.cursor()
                sql =  "SELECT resultID FROM itemGroup WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)
                groupid = cur.fetchall()


                cur = db.cursor()
                sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (groupid[0][0])
                cur.execute(sql)
                db.commit
            else:
                print("You can't do it! Try other items!")
        else:
            print("You dont have this item")

    else:
        print("What you want to combine? ")














main()