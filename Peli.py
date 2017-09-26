import mysql.connector
import OPEN
import MOVE

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def main():
    location = 1
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

        if action == "location" or action == "where":
            print("You are at ID: " + str(MOVE.getPlayerLoc()))

        if action == "open":        # open object
            if target != '':
                if len(input_command) == 3:
                    objectname = input_command[1]
                    OPEN.openFunc(location,target,objectname)
                else:
                    OPEN.openFunc(location, target)
            else:
                print("Try again")

        if action == "go" or action == "move":
            if target != "":
                MOVE.movePlayer(target)
            else:
                print("Try again")

        if action == "get":      #get item
            if target!="":
                getFunc(target)
            else:
              print("It's just a verb!, Try again!")

        if action == "drop":
            if target!="":
                getFunc(target)
            else:
                print("It's just a verb!, Try again!")
main()
