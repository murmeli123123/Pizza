import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

command = ''
while command != 'stop':
    command = input("What to do next: ").split(' ')
    if command[0].upper() == 'OPEN':
        sql = "SELECT object.objectID, object.name, objecttype.objectname, object.actionID \
                FROM objecttype join object \
                WHERE object.typeID = objecttype.typeID"
        cursor.execute(sql)
        result = cursor.fetchall()        
        objectname = ''        
        for x in result:
            # jos paikassa on monia door objekteja lisää ne merkkijonoon
            if command[1].upper() != x[1] and command[1].upper() == x[2]:
                objectname += x[1] + ', '
            # jos sekä objekti että objektin nimi on oikein ja objektilla on action
            elif command[1].upper() == x[1] and command[2].upper() == x[2] and x[3] != None:
                sql = "SELECT actiontable.description \
                        FROM actiontable WHERE actiontable.actionID = %s" % x[3]
                cursor.execute(sql)
                result = cursor.fetchall()
                # prittaa objektin action
                for x in result:
                    print(x[0])
        # Tulosta kaikki tämän paikan objektien nimet
        if len(objectname) > 1:
            print("There is multiple objects: " + objectname)
