import mysql.connector

def openFunc(loc, request, *objectname):


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

    def getObjectType(request): # Getting the objecttype.typeID
        typename = request.upper()
        sql = "SELECT objecttype.typename, object.typeID \
                FROM objecttype join object \
                WHERE objecttype.typename = '%s' and objecttype.typeID = object.typeID and object.placeID = %i" % (typename, loc)
        cursor.execute(sql)
        result = cursor.fetchall()
        for x in result:
            if typename == x[0]:
                return x[1]

    multiple = 'There is multiple objects:'     # String for multiple objects
    y = 0       # Used for counting
    objectID = None # object.objectID
    objectType = getObjectType(request) # objecttype.typeID
    action = None # actiontable.actionID

    if objectType != None: # if objectType has been initialized get results
        sql = "SELECT object.objectID, object.name, objecttype.typename, object.actionID, object.usable \
                FROM objecttype join object \
                WHERE object.typeID = objecttype.typeID and object.placeID = %i and objecttype.typeID = %i" % (loc, objectType)
        cursor.execute(sql)
        result = cursor.fetchall()
    else:
        print("You can't do that!")
        return

    if objectname != ():    # If objectname is given
        objectname = ''.join(objectname).upper() # Make it into string
        for x in result:
            if objectname == x[1] and x[4] == 1: # If objectname matches and
                objectID = x[0]               # is usable -> Set objectID.
                action = getAction(objectID)   # Get actions
        if objectID == None:    #If no objectID was stored
            print("You can't do that!")
        elif action == None and objectID != None: #If objectID was found and no action
            print("Jack opens the " + objectname + ' ' + request.upper())
            return

    elif len(result) > 1:   # If there is multiple objects
        for x in result:
            y += 1  # start the counter
            multiple += ' ' + x[1] + ' ' + x[2] # Add to the string
            if y != len(result):        # While y is smaller than lenght of result
                multiple += ','      # add a comma
        print(multiple)
        return

    elif len(result) == 1 : # If there is only one result
        for x in result:
            if x[4] == 1:   # If it's usable
                action = getAction(x[0]) # Get actions
                objectname = x[2]       # Set objectname
            else:
                print("The "+ x[1] + " is not usable")

    if action != None: # If there is actions
        print(action)
    elif action == None and request.upper() == objectname:
        print("Jack opens the " + objectname)
