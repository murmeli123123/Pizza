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


            # get
            # move
            # inventory
        print(action, target)
        if action == "get" or "take":
            getFunc( target )

def getFunc(target):

    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            cur = db.cursor()
            sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
            cur.execute(sql)
            rez = cur.fetchall()

            cur = db.cursor()
            sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'  " % (rez[0][0])
            cur.execute(sql)
            db.commit()
            print ("You take a new item: " + target)
        else:
           print(target + " not found!")



def getFunc(target):

    cur = db.cursor()
    sql = "SELECT name FROM Item"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            cur = db.cursor()
            sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
            cur.execute(sql)
            rez = cur.fetchall()

            cur = db.cursor()
            sql = "UPDATE item SET playerID = 1 WHERE itemID = '%i'  " % (rez[0][0])
            cur.execute(sql)
            db.commit()
            print ("You take a new item: " + target)
        else:
           print(target + " not found!")



def dropFunc(target):

    cur = db.cursor()
    sql = "SELECT name FROM Item WHERE playerID = 1"
    cur.execute(sql)
    rez = cur.fetchall()
    for i in rez:
        if i[0] == target:
            cur = db.cursor()
            sql = "SELECT itemID FROM Item WHERE name = '%s' " % (target)
            cur.execute(sql)
            rez = cur.fetchall()

            cur = db.cursor()
            sql = "UPDATE item SET playerID = 0 WHERE itemID = '%i'  " % (rez[0][0])
            cur.execute(sql)
            db.commit()
            print ("You droped item: " + target)
        else:
           print(target + " not found in you inventory!")

 




















main()