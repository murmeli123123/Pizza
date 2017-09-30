import mysql.connector


db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)


# db = mysql.connector.connect(host = "localhost",
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

        # elif action == "drop":
        #     if target!="":
        #         dropFunc(target)
        #     else:
        #         print("It's just a verb!, Try again!")
        #
        # elif action == "combine":
        #     combFunc(input_command)
        #
        # elif action == "show":
        #     showFunc()
        #
        # elif action =="dropall":
        #     drop_all_func()


def getFunc(target):
    cur.execute("SELECT placeID FROM player;")
    player_placeid = cur.fetchall()

    cur.execute("SELECT itemID FROM item WHERE name = '%s';" % (target))
    target_item_id = cur.fetchall()

    cur.execute("SELECT playerID FROM item WHERE name = '%s';" % (target))
    player_id = cur.fetchall()[0][0]

    sql = "SELECT item.name FROM item, object \
    WHERE item.objectID = object.objectID AND object.placeID = '%i'" % (player_placeid[0][0])
    cur.execute(sql)
    item_list = cur.fetchall()

    ilist = []   #new list for items

    for i in item_list:
        ilist.append(*i)   #append all items to list

    if target in ilist:
        if player_id != 1:
            cur.execute("UPDATE item SET playerID = 1 WHERE itemID = '%i'" % (target_item_id[0][0]))
            print( target + " in your inventory")
        else:
            print("This item in your inventory")
    else:
        print("This item not founded")























main()
