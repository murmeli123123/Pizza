import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

#main function is a game core!! Function call on the end of code!

def main():
  # Initialize player location

    location = "something location"
    action = ""
                            # location is current location
                            # command is action verb
                            # target object 

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
                dropFunc(target)
            else:
                print("It's just a verb!, Try again!")   

        elif action == "combine":
            combFunc(input_command)

        elif action == "show":
            showFunc()
            


def showFunc():
    cur = db.cursor()
    sql = "SELECT name FROM item WHERE playerid = 1"
    cur.execute(sql)
    rez = cur.fetchall()

    for i in rez:
        print(str(i[0]))
       

    return

def combFunc(input_command):
    item_one = input_command[1].lower()
    item_two = input_command[len(input_command)-1].lower()
    if len(input_command) >= 3:
        count = 0
        cur = db.cursor()
        sql = "SELECT name, groupID FROM item WHERE playerID = 1 and groupID > 0"
        cur.execute(sql)
        item_one_rez = cur.fetchall()
        for i in item_one_rez:

            if i[0] == item_one or i[0] == item_two:
                count = count + 1

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
            print("Its done!")
        else:
            print("You can't do it! Try other items!")
    else:
        print("What you want to combine? ")
     



def getFunc(target):
    item = 0
    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            item = 1


    cur = db.cursor()
    sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    rez = cur.fetchall()

    cur = db.cursor()
    sql = "SELECT playerID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    playerid = cur.fetchall()


    if item == 1:
        if playerid[0][0] != 1: 
          cur = db.cursor()
          sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'  " % (rez[0][0])
          cur.execute(sql)
          db.commit()
          print ("You take a new item: " + target)
        else:
          print("Item in your inventory! ")
    else:
      print("Item not found")



def dropFunc(target):
    item = 0
    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            item = 1


    cur = db.cursor()
    sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    rez = cur.fetchall()

    cur = db.cursor()
    sql = "SELECT playerID FROM Item WHERE name = '%s' " % (target)
    cur.execute(sql)
    playerid = cur.fetchall()


    if item == 1:
        if playerid[0][0] == 1: 
            cur = db.cursor()
            sql = "UPDATE item SET playerID = NULL WHERE itemID = '%i'  " % (rez[0][0])
            cur.execute(sql)
            db.commit()
            print ("You droped item: " + target)
        else:
            print("You just droped it")
        
    else:
      print("Item not found")
























main()