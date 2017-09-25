import mysql.connector
import OPEN

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def main():
    location = 2
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

        if action == "open":
            if len(input_command) == 3:
                objectname = input_command[1]
                OPEN.openFunc(location,target,objectname)
            else:
                OPEN.openFunc(location, target)

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
main()
