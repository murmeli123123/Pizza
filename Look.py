import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)

# Jos ainoastaan look yms. komento tulostetaan paikan missä pelaaja on description
def lookplace():
    sql = "SELECT place.description \
            FROM place, player \
            WHERE place.placeID = player.placeID"
    cursor.execute(sql)
    result = cursor.fetchall()
    for x in result:
        print(x[0])
    itemsaround = placeitems()
    objectsaround = placeobjects()
    print("Objects in here are:")
    for x in objectsaround:
        print(x[0])
    print("Items in here are:")
    for x in itemsaround:
        print(x[0])

# Hakee description katsotusta esineestä tai objektista
def lookitem():
    y = int(0)
    string = ''.join(command[-1])
    itemsaround = placeitems()
    objectsaround = placeobjects()
    carrying = inventory()
    allitems = itemsaround + carrying
    for x in allitems:
        if string in x:
            sql = "SELECT item.description, item.weight \
                    FROM item \
                    WHERE item.name  = '%s'" % string
            cursor.execute(sql)
            result = cursor.fetchall()
            y = 1
    for x in objectsaround:
        if string in x:
            sql = "SELECT object.description \
                    FROM object \
                    WHERE object.name  = '%s'" % string
            cursor.execute(sql)
            result = cursor.fetchall()
            y = 1
    if y == 1:
        for x in result:
            print(x[0])
    else:
        print("What do you mean by " + str(string) + "?")

# Hakee paikassa olevat objektit
def placeobjects():
    sql = "SELECT object.name \
            FROM player, place, object \
            WHERE player.placeID = place.placeID \
            AND place.placeID = object.placeID"
    cursor.execute(sql)
    objectsaround = cursor.fetchall()
    return objectsaround

# Hakee paikassa olevat esineet
def placeitems():
    sql = "SELECT item.name \
            FROM player, place, object, item \
            WHERE player.placeID = place.placeID \
            AND place.placeID = object.placeID \
            AND object.objectID = item.objectID"
    cursor.execute(sql)
    itemsaround = cursor.fetchall()
    return itemsaround

# Hakee pelaajan mukana olevat esineet
def inventory():
    sql = "SELECT item.name \
            FROM item INNER JOIN player \
            ON item.playerID = player.playerID"
    cursor.execute(sql)
    carrying = cursor.fetchall()
    return carrying

cursor = db.cursor()
command = ''
while command != 'stop':
    command = input("What to do next: ").split(' ')
    if command[0].upper() == 'LOOK' or 'EXAMINE' or 'VIEW':
        if len(command) < 2:
            lookplace()
        else:
            lookitem()
