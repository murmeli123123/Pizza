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


        if action == "get":      #get item
            if target!="": 
                getFunc(target)
            else:
              print("It's just a verb!, Try again!")

        elif action == "drop": 
            if target!="": 
                getFunc(target)
            else:
                print("It's just a verb!, Try again!")   
            


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