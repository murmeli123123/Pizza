import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

command = ''
while command != 'stop':
    # print(command)
    command = input("What to do next: ").split(' ')
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
        
    
