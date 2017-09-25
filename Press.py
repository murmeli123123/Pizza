import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def buttonPress(location, name):
    def getAction(Id):
            sql = "SELECT actiontable.description \
                        FROM actiontable WHERE actiontable.actionID = %s" % Id
            cursor.execute(sql)
            result = cursor.fetchall()
            for x in result:
                print(x[0])

    sql = "SELECT object.objectID, object.name, object.usable, object.actionID \
    FROM objecttype join object WHERE objecttype.typeID = object.typeID \
    AND object.placeID = %s AND object.typeID = 2" % location
    cursor.execute(sql)
    result = cursor.fetchall()
    if len(result) == 0:
        print("You can't do that")
    if len(result) > 1:
        for x in result:
            if name.upper() == x[1]:
                if x[2] == 0:
                    print("You can't do that!")
                else:
                    sql = "UPDATE object SET usable = 0 WHERE object.objectID = %i" % x[0]
                    cursor.execute(sql)
                    db.commit()
                    getAction(x[3])

    else:
        for x in result:
            if name.upper() == x[1]:
                if x[2] != 0:
                    sql = "UPDATE object SET usable = 0 WHERE object.objectID = %i" % x[0]
                    cursor.execute(sql)
                    db.commit()
                    getAction(result)
            else:
                print("You can't do that!")


buttonPress(1, "button")
