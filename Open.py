import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def openFunc(loc, objecttype, *objectname):

    def getAction(Id): # For getting actions
            sql = "SELECT actiontable.description FROM actiontable \
                    JOIN object \
                    WHERE actiontable.actionID = object.actionID \
                    AND object.objectID = %i " % Id
            cursor.execute(sql)
            result = cursor.fetchall()
            for x in result:
                return(x[0])

    def setUsable(Id): # Setting object usable to 0
        sql = "UPDATE object SET usable = 0 WHERE object.objectID = '%s' " % Id
        cursor.execute(sql)

    def getUsable(Id): # Getting the object usable state
        sql = "SELECT object.usable FROM object WHERE object.objectID = %i" % Id
        cursor.execute(sql)
        result = cursor.fetchall()
        for x in result:
            return x[0]

    sql = "SELECT object.objectID, object.name, objecttype.typename, object.actionID, object.usable \
            FROM objecttype join object \
            WHERE object.typeID = objecttype.typeID and object.placeID = %i and objecttype.typename = '%s'" % (loc, objecttype)
    cursor.execute(sql)

    result = cursor.fetchall()
    multiple = 'There is multiple objects:'     # String for multiple objects
    y = 0       # Used for counting
    objectID = None
    action = None

    if objectname == ():   # If name for object is not defined
        for x in result:
            y += 1
            if objecttype.upper() == x[2]:
                multiple += ' ' + x[1] + ' ' +  x[2]
                if y != len(result):
                    multiple += ','
        if y == 1:   # If there is only one object, set objectID.
            objectID = x[0]
            if getUsable(objectID) != 0:     # Check if the object is usable
                action = getAction(objectID)   # Get action if any
                if action == None:
                    print("Jack opens the " + objecttype)
                else:
                    print(action)
            else:
                print("You can't do that!")
        elif len(multiple) > 26:  # Else print the list of objects
            print(multiple)
        else:
            print("You can't do that!")
        y = 0

    elif objectname != ():      # If objectname has been defined
        name = ''.join(objectname)
        for x in result:
            if name.upper() == x[1] and objecttype.upper() == x[2]:
                objectID = x[0] # Set objectID if name and objecttypename matches
        if objectID == None:
            print("You can't do that!")
        elif getUsable(objectID) != 0:    # Check if its usable
            if getAction(objectID) != None: # Get actions if any
                print(getAction(objectID))
            elif objecttype.upper() == 'BUTTON':
                print("Jack pushes the " + name + ' ' + objecttype)
            else:
                print("Jack opens the " + name + ' ' + objecttype)
        else:
            print("You can't do that!")
