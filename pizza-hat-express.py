import mysql.connector
import sys

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser04",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)

cur = db.cursor()

#main function is a game core!! Function call on the end of code!

def main():
  # Initialize player location
    location = ""
    action = ""



                            # command is action verb
                            # target object
    # Dont ask
    title = "*"*40 + "\n*" + '{:>28}'.format('PIZZA-HAT EXPRESS') + '{:>11}'.format('*') + ("\n*" + '{:>39}'.format('*')) +  '{:>2}'.format('\nTHE BEST TEXT ADVENTURE GAME IN THE WORLD') + ("\n*" + '{:>39}'.format('*'))*2 + "\n" + "*"*40
    print(title + "\n")
    intro = "\n\nYour name is Jack. The year is 2318. You are just an ordinary pizza delivery guy for an intergalactic pizza company.\n\nYou have just woken from a late night shift. There seems to be some email on the computer. Please experience the world around you and maybe put on some clothes.\n\n"
    myprint(intro)

    while action!="quit" or location!="EXIT":
        # location is current location
        locationID = getLocID()
        location = getLocName()
        # input_command is the initial inputted command
        input_command=input("> ").split()
        filters = ["and","for","the","with","a","an","at","of","on","in"," "]
        # final_command is the command that is fed to the game
        final_command = []
        for x in input_command:
            if x in filters:
                x = x.replace(x, "")
            if len(x) > 0:
                final_command.append(x)

        if len(final_command) >= 1:
            action = final_command[0].lower()
        else:
            action = ""
        if len(final_command) >= 2:
            target = final_command[len(final_command)-1].lower() #lower make the string to lowercase
        else:
            target = ""
        if action == "get" or action == "take":
            if target!="":
                getFunc(target)
            else:
              print("It's just a verb!, Try again!")

        elif action == "i" or action == "inventory":
            inventoryfunc()

        elif action == "combine":
            combFunc(final_command)

        elif action == "help":
            getHelp()

        elif action == "open":
            if target != '':
                if len(final_command) == 3:
                    objectname = final_command[1]
                    openFunc(locationID,target,objetctname)
                else:
                    openFunc(locationID, target)
            else:
                print("Try again")

        elif action == "use":
            if target != '':
                useFunc(target, locationID)

        elif action == "press":
            pressFunc(locationID)

        elif action == "show" or action == "look":
            if target != "":
                showitemfunc(target)
            else:
                lookaroundfunc()

        elif action == "n" or action == 's' or action == 'w' or action == 'e' or action == 'north' or action == 'south' or action == 'west' or action == 'e':
            movefunc(action)

        elif action == 'map':
            getmap()

        else:
            if action == 'quit':
                return
            print("I dont understand this command")

def showitemfunc(target):

    try:
        # Get object descriptions from the same placeID that the player is in
        cur.execute("SELECT objectID, description \
        FROM object, player WHERE player.placeID = object.placeID AND object.name = '%s';" % (target))
        item_desc = cur.fetchall()
        # Get item names and descriptions from the objects
        cur.execute("SELECT name, description FROM item WHERE objectID = '%i';" % item_desc[0][0])
        items = cur.fetchall()
    except IndexError:
        desc = ''
        # If error is raised check player inventory
        for x in getInventory():
            if x[0] == target:
                desc = x[1]
        if len(desc) > 1:
            myprint(desc)
        else:
            print("This place doesn't contain this object")

    else:
        myprint(item_desc[0][1])
        for i in items:
            print("| " + i[0] + " |",end=" : ")
            print(i[1])

def lookaroundfunc():
    cur.execute("SELECT place.description, player.placeID FROM place, player WHERE player.placeID = place.placeID;")
    rez = cur.fetchall()
    myprint(rez[0][0])

    cur.execute("SELECT name FROM object WHERE object.placeID = '%i';" % (rez[0][1]))
    objects = cur.fetchall()
    print("\nIn this place are:", end="\n")

    for i in objects:
        myprint(i[0])
    print("\nInput 'show' and object, if you want to see it.")

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
    print("You are carrying: ", end=" ")
    for i in all_items:
        print(" | " + i[0] + " | ", end=" ")
    print()

def getInventory():
    cur.execute("SELECT item.name, item.description \
            FROM item INNER JOIN player \
            ON item.playerID = player.playerID")
    carrying = cur.fetchall()
    return carrying

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
            if 'UPDATE' in action[0]:
                cur.execute(action[0])
            else:
                print(action[0])

        if player_id != 1:
            cur.execute("UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (target_item_id))
            cur.execute("UPDATE item SET objectID = NULL WHERE itemID = '%i'" % (target_item_id))

            print("You pick up: " + target)
        else:
            print("This item is already in your inventory")
    else:
        print("This item is not found")

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
            cur.execute("UPDATE object SET locked = 0 WHERE object.objectID = %i;" % objectID)
            return

    elif len(result) > 1:   # If there is multiple objects
        for x in result:
            y += 1  # start the counter
            multiple += ' ' + x[1] + ' ' + x[2] # Add to the string
            if y != len(result):        # While y is smaller than lenght of result
                multiple += ','      # add a comma
        print(multiple)             # print the string
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
        cur.execute("UPDATE object SET locked = 0 WHERE object.objectID = %i;" % objectID)
        return

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
            myprint(getAction(result[0][2], 0)[0])
        else:
            print("You can't use that!")
    except:
        IndexError
        print("You can't use that!")

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

def mapbase():
    base = list(" _______\n|\t|\n|\t|\n|_______|")
    return base
# Kartta siitä ruudusta missä pelaaja on
def getmap():
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

def storyMode(index):       # Used for storytelling. Activated by pressing by buttons.

    if index == 1:
        ask = input("Are you sure you want to advance to the next area ? (Y/N) ")
        if ask == 'yes' or ask == 'Y' or ask == 'y':
            wait = 0
            cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 995 AND 998")
            result = cur.fetchall()
            if wait == 0:
                myprint(result[0][0])
                while wait == 0:
                    command = input("> ")
                    if command == 'wait' or command == 'WAIT':
                        wait += 1
                myprint(result[1][0])
                while wait == 1:
                    command = input("> ")
                    if command == 'wait' or command == 'WAIT':
                        wait += 1
                myprint(result[2][0])
                while wait == 2:
                    command = input("> ")
                    if command == 'wait' or command == 'WAIT':
                        wait += 1
                myprint(result[3][0])

                cur.execute("SELECT planet.name, planet.description FROM planet WHERE planet.planetID BETWEEN 21 and 26")
                result = cur.fetchall()
                y = 1
                print("SYSTEM: " + '{:>2}'.format('PROTEUS'))
                for x in result:
                    print(str(y) + '{:>25}'.format(x[0]))
                    y += 1
                while True:
                    try:
                        command = int(input("\nORBITAL BODIES DISCOVERED! EMERCENCY LANDING POSSIBLE! CHOOSE A PLANET TO LAND: "))
                        if command > 6 or command < 1:
                            continue
                    except ValueError:
                        continue
                    break

                myprint(result[command - 1][1])
                if command == 4 or command == 6:
                    print("GAME OVER LOSER")
                    gameOver(result[command -1][0])
                else:
                    cur.execute("UPDATE player SET placeID = 24 WHERE playerID = 1" )
                    myprint('\nJack crashes to ' + result[command - 1][0]  + ' and barely makes it alive.\n\nThe poorly fitted space ship is badly damaged and Jack has to repair his engine before advancing his journey.')
        elif ask == 'n' or ask == 'N' or ask == 'no':
            print("press again when you are ready")
            return
        else:
            return

    elif index == 2:
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 899 AND 993")
        result = cur.fetchall()
        inventory = getInventory()
        license = False

        for x in inventory:
            if x[0] == 'drivers-license':
                license = True

        if license == False:
            print("Please pick up the required drivers-license first")
            return

        myprint('\n' + result[1][0] + '\n')
        while wait == 0:
            command = input("> ")
            myprint(result[0][0])
            wait += 1

        myprint('\n' + result[2][0] + '\n')
        while wait == 1:
            command = input("> ")
            if command == 'wait' or command == 'WAIT':
                wait += 1

        myprint('\n' + result[3][0] + '\n')
        print("")
        myprint('\n' + result[4][0] + '\n')
        print("")

        cur.execute("UPDATE player SET placeID = 2;")
        target = "starship-key-card"
        getFunc(target)
        return

    elif index == 3:
        cur.execute("SELECT itemID FROM item WHERE playerID = 1;")
        all_items = cur.fetchall()
        r=0
        for x in all_items:
            if 41 in x or 42 in x or 43 in x or 44 in x:
                r+=1
        if r != 4:
            print("You dont have all the ingredients to make the pizza.")
            return
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 1040 AND 1041")
        result = cur.fetchall()

        if wait == 0:
            myprint('\n' + result[0][0] + '\n')
            while wait == 0:
                command = input("> ")
                if command == 'wait' or command == 'WAIT':
                    wait += 1
                else:
                    print("Probably best if I wait for the pizza to be ready.")
            print('\n' + result[1][0] + '\n')
            cur.execute("UPDATE item SET objectID = 46 WHERE itemID = 46")
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 41")
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 42")
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 43")
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 44")
            target = "pizza"
            getFunc(target)

    elif index == 6:
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 1042 AND 1044")
        result = cur.fetchall()

        if wait == 0:
            myprint('\n' + result[0][0] + '\n')
            while wait == 0:
                command = input("> ")
                if command == 'wait' or command == 'WAIT':
                    wait += 1
            myprint('\n' + result[1][0] + '\n')
            while wait == 1:
                command = input("> ")
                if command == 'wait' or command == 'WAIT':
                    wait += 1
            myprint('\n' + result[2][0] + '\n')
            cur.execute("UPDATE item SET objectID = 41 WHERE itemID = 411;")
            target = "secret-note"
            getFunc(target)
            cur.execute("UPDATE player SET placeID = 43")
            cur.execute("UPDATE movingtable SET placeID = NULL WHERE moveID = 429")
        else:
            myprint(result[2][0])
            gameOver("Proteus")

    elif index == 4:
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 895 AND 897")
        result = cur.fetchall()
        selection = ''
        myprint(result[0][0])
        while len(selection) < 3:
            number = input("> ")
            print("*beep*")
            selection += number
        if selection == '123':
            myprint(result[1][0])
            cur.execute("UPDATE object SET placeID = 27 WHERE objectID = 236")
        else:
            myprint(result[2][0])
            gameOver("Proteus")
    elif index == 5:
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 880 AND 883")
        result = cur.fetchall()

        while wait == 0:
            myprint(result[0][0])
            command = input(">")
            if command == 'wait' or command == 'WAIT':
                wait += 1

        myprint(result[1][0])
        myprint(result[2][0])
        myprint(result[3][0])

        while wait == 1:
            command = input(">")
            if command == 'wait' or command == 'WAIT':
                wait += 1
            else:
                print("Mayby you should wait for the creatures to leave the shop!")
        myprint("Once the creatures leave you push the sewer cover aside and a path opens which you can use to enter the shop.")
        cur.execute("UPDATE movingTable SET placeID = 26 WHERE moveID = 29")

    elif index == 9:
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 884 AND 889")
        result = cur.fetchall()

        ask = input("Are you sure you want to advance to the next area ? (Y/N) ")
        if ask == 'yes' or ask == 'Y' or ask == 'y':
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 288")
            myprint(result[0][0])
            myprint(result[1][0])
            while wait == 0:
                command = input("> ").split()
                if 'hit' in command:
                    wait += 1
                else:
                    print("Please hit the dashboard.")
            myprint(result[2][0])
            myprint(result[3][0])
            while wait == 1:
                command = input("> ").split()
                if 'sleep' or 'rest' or 'wait' in command:
                    wait += 1
                else:
                    print("You need to rest now!")
            print("...\n...\n...\nzzz\nzZz\n...\nzZZ\n..")
            myprint(result[4][0])
            myprint(result[5][0])
            print("\n\nJack arrives at HIP-17710 refueling station.")
            cur.execute("UPDATE player SET placeID = 31 WHERE playerID = 1")

    elif index == 10:

        cur.execute("SELECT planet.name FROM planet WHERE planet.planetID BETWEEN 31 and 34")
        result = cur.fetchall()
        y = 1
        print("::Public transportation system::")
        for x in result:
            print(str(y) + '{:>25}'.format(x[0]))
            y += 1

        while True:
            try:
                selection = int(input("\nWelcome to the public transportation system. Choose a planet to travel to: "))
                if selection > 1 or selection < 4:
                    break
            except ValueError:
                print("Please use values between 1 and 4.")
                continue
            break

        if selection == 1:
            print("\nJack travels to %s" % result[selection - 1][0])
            cur.execute("UPDATE player SET placeID = 32 WHERE playerID = 1")
        elif selection == 2:
            print("\nJack travels to %s" % result[selection - 1][0])
            cur.execute("UPDATE player SET placeID = 33 WHERE playerID = 1")
        elif selection == 3:
            print("\nJack travels to %s" % result[selection - 1][0])
            cur.execute("UPDATE player SET placeID = 34 WHERE playerID = 1")
        elif selection == 4:
            print("\nJack travels to %s" % result[selection - 1][0])
            cur.execute("UPDATE player SET placeID = 31 WHERE playerID = 1")

    elif index == 11:
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 770 AND 772")
        result = cur.fetchall()
        myprint(result[0][0])
        myprint(result[1][0])
        myprint(result[2][0])
        count = 0
        while True:
            question = 'The stranger asks you a question: '

            if count == 0:
                answer = input(question + '1 + 1 = ? ')
                if answer == '2':
                    print("Correct!")
                    count += 1
                else:
                    print("That's not quite right..")
                    break
            if count == 1:
                answer = input(question + 'What earth animal has a long neck? ')
                if answer  == 'giraffe':
                    print("Correct!")
                    count += 1
                else:
                    print("That's not quite right..")
                    break
            if count == 2:
                answer = input(question + 'The sum of all the natural numbers? ')
                if answer  == '-1/12':
                    print("Correct!")
                    target = "glowing-vial"
                    cur.execute("UPDATE item SET objectID = 310 WHERE itemID = 37")
                    getFunc(target)
                else:
                    print("That's not quite right..")
                    break
            break

    elif index == 20:
        wait = 0
        cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 311")
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 777 AND 778")
        result = cur.fetchall()
        myprint(result[0][0])
        myprint(result[1][0])
        while wait == 0:
            command = input("> ")
            if command == 'wait':
                wait += 1
            else:
                print("You should wait for the hyperdrive travel to complete")

        print("\nJack arrives to Cernobog")
        cur.execute("UPDATE player SET placeID = 42 WHERE playerID = 1")

    elif index == 12:
        cur.execute("SELECT itemID FROM item WHERE playerID = 1;")
        items = cur.fetchall()
        r=0
        for x in items:
            if 49 in x or 411 in x:
                r+=1
        if r == 2:
            cur.execute("UPDATE player SET placeID = 47;")
            cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID = 1045")
            result = cur.fetchall()
            myprint(result[0][0])
        elif r == 1:
            print("I still need to make the poison pizza.")
    elif index == 13:
        wait = 0
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 1046 AND 1047")
        result = cur.fetchall()
        if wait == 0:
            myprint('\n' + result[0][0] + '\n')
            while wait == 0:
                command = input("> ")
                if command == 'wait' or command == 'WAIT':
                    wait += 1
                else:
                    print("You should probably wait for a while before doing in.")
            print('\n' + result[1][0] + '\n')
            cur.execute("UPDATE object SET locked = 0 WHERE objectID = 47")
    elif index == 14:
        wait = 0
        cur.execute("UPDATE player SET placeID = 1000;")
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 1048 AND 1051")
        result = cur.fetchall()
        if wait == 0:
            myprint('\n' + result[0][0] + '\n')
            while wait == 0:
                command = input("> ")
                if command == 'wait' or command == 'WAIT':
                    wait += 1
                else:
                    print("Its probably best to just wait.")
            myprint('\n' + result[1][0] + '\n')
            while wait == 1:
                command = input("> ")
                if command == 'y' or command == 'Y' or command == 'yes' or command == 'YES':
                    wait += 1
                elif command == 'n' or command == 'N' or command == 'no' or command == 'NO':
                    wait += 2
                else:
                    myprint("YES or NO that should not be so hard, after what you have been trough... Or was it all just pure luck?")
            if wait == 2:
                myprint('\n' + result[2][0] + '\n')
                print('You won the game')
            elif wait == 3:
                myprint('\n' + result[3][0] + '\n')
                print('You won the game')
    elif index == 15:
        cur.execute("SELECT actiontable.description FROM actiontable WHERE actionID BETWEEN 765 AND 768")
        result = cur.fetchall()
        inventory = getInventory()
        hasItem = False

        myprint(result[0][0])
        for item in inventory:
            if item[0] == 'domestic-pet':
                hasItem = True
        if hasItem:
            myprint(result[2][0])
            myprint(result[3][0])
            getFunc('quantum-flux')
            cur.execute("UPDATE item SET playerID = NULL WHERE itemID = 31")
        else:
            myprint(result[1][0])

def pressFunc(locationID):
    def travel():
        if locationID == 3:
            storyMode(1)
        elif locationID == 1:
            storyMode(2)
        elif locationID == 415:
            storyMode(6)
        elif locationID == 27:
            storyMode(4)
        elif locationID == 26:
            storyMode(5)
        elif locationID == 45:
            storyMode(3)
        elif locationID == 28:
            storyMode(9)
        elif locationID == 31 or locationID == 32 or locationID == 33 or locationID == 34:
            storyMode(10)
        elif locationID == 39:
            storyMode(11)
        elif locationID == 311:
            storyMode(20)
        elif locationID == 416:
            storyMode(12)
        elif locationID == 48:
            storyMode(13)
        elif locationID == 417:
            storyMode(14)
            sys.exit()
        elif locationID == 310:
            storyMode(15)

    cur.execute("SELECT object.usable FROM object join objecttype WHERE object.placeID = %i \
            and objecttype.typename = 'button' and object.typeID = objecttype.typeID" % locationID)
    result = cur.fetchall()
    if len(result) > 0 and result[0][0] == 1:
        travel()
    else:
        print("You can't press that yet!")

def getHelp():
    print("Use these commands to interact with the game:\n\n \
    Look or show: To look around or to examine objects.\n \
    N, S, W, E or north, south, west, east: To move around the game world.\n \
    Use: To use an object.\n \
    Press: To press a button.\n \
    Wait: To wait when you are told to.\n \
    Map: To print out a map, for navigation purposes.\n \
    Open: To open doors and various objects.\n \
    Inventory or i: To examine your inventory.\n \
    Get or take: To pick up an item.\n \
    Combine: To combine two items together.\n \
    Quit: To quit the game. You wouldn't want to do that, would you?")

def gameOver(location):
    print("Jack dies a horrible death on " + location + '\n\n\n\n')
    sys.exit()

def combFunc(final_command):

    if len(final_command) >= 3:

        item_one = final_command[1].lower()
        item_two = final_command[len(final_command)-1].lower()

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

                cur = db.cursor()
                sql = "UPDATE item SET playerID = NULL WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)

                cur = db.cursor()
                sql =  "SELECT resultID FROM itemGroup WHERE groupID = '%i'" % (result[0][0])
                cur.execute(sql)
                groupid = cur.fetchall()

                action = getAction(groupid[0][0], 1)
                if action != None:
                    cur.execute(action[0])

                cur = db.cursor()
                sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (groupid[0][0])
                cur.execute(sql)
                cur.execute("SELECT name FROM item WHERE  itemID = '%i'" % (groupid[0][0]))
                result = cur.fetchall()
                myprint("Jack combines the two items and gets a " + result[0][0])

            else:
                print("You can't do it! Try other items!")
        else:
            print("You dont have this item")

    else:
        print("What you want to combine? ")

def myprint(text):
    max_length = 70
    arr = text.split()
    count = 0
    for i in arr:
        if count + len(i) <= max_length:
            if count > 0:
                print(" ", end='')
                count = count + 1
            print(i, end='')
        else:
            print("")
            count = 0
            print(i, end='')
        count = count + len(i)
    print("")


main()
