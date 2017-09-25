import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()
'''
# loc = Player.placeID
loc = 2
# Objecttype = objecttype.typename , Minkälainen objekti halutaan avata: ovi, laatikko yms.
objecttype = "door"
objecttype.upper()
# Objectname = object.name, mikä objekti halutaan avata jos useita.
name = "jail3"
'''

def openFunc(loc, objecttype, *objectname):
    # For getting the actions
    def getAction(result):
        for x in result:
                sql = "SELECT actiontable.description \
                        FROM actiontable WHERE actiontable.actionID = %s" % x[3]
                cursor.execute(sql)
                result = cursor.fetchall()
                for x in result:
                    print(x[0])

    sql = "SELECT object.objectID, object.name, objecttype.typename, object.actionID \
            FROM objecttype join object \
            WHERE object.typeID = objecttype.typeID and object.placeID = %i and objecttype.typename = '%s'" % (loc, objecttype)
    cursor.execute(sql)
    result = cursor.fetchall()
    multiple = ''
    name = ''.join(objectname)
    done = 0

    # If there is only one objecttype in place
    if len(result) == 1:
        getAction(result)
    else:
        for x in result:
            # If there is no objectname defined
            if objectname == ():
                multiple += ' ' + x[1]
            else:
                # If player has defined which door to open and If object has actionID
                if x[1] == name.upper():
                    done = 1
                    if x[3] != None:
                        getAction(result)
                    else:
                        print("Jack opens the %s door" % x[1])
                # If objectname doesn't match any objects in place
                else:
                    multiple += ' ' + x[1]
        # Print place objects
        if done == 0:
            print("There is multiple objects: " + multiple)
