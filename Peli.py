import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

#main function is a game core!! Function call on the end of code!

def mainFunc():
  # Initialize player location

    location = "something location"
    command = ""
                            # location is current location
                            # command is action verb
                            # target object 

    while command!="quit" and location!="EXIT":

        input_command=input("> ").split()

        if len(input_string)>=1:
            action = input_command[0].lower()
        else:
            action = ""     
        if len(input_string)>=2:
            target = input_command[len(input_command)-1].lower() #lower make the string to lowercase
        else:
            target = ""     


            # get
            # move
            # inventory
        if action=="inventory" or action=="i":
              inventoryFunc()




def inventoryFunc():
    cur = db.cursor()
    sql = "SELECT ........................'"
    cur.execute(sql)
    if cur.rowcount>=1:
        print("You carry the following items:")
        for row in cur.fetchall() :
            print (" - " + row[0])
    else:
        print("You don't carry anything.")
    return


command = ''
while command != 'stop':
    # print(command)
    command = input("> ").split(' ')
    if command[0] == 'open':
        sql = "SELECT object.typeID, objecttype.name \
                FROM object inner join objecttype \
                WHERE object.typeID = objecttype.typeID"
        cursor.execute(sql)
        result = cursor.fetchall()
        for x in result:
            if x[1] == 'DOOR':
                print("Avasit oven JIHUU")
                command = 'stop'
        
    
main()