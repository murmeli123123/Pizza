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
    print(result)

# Hakee description katsotusta esineestä tai objektista
def lookitem():
    itemsaround = placeitems()
    objectsaround = placeobjects()
    carrying = inventory()
    allitems = itemsaround + carrying
    print(allitems)
    print(objectsaround)
    print(command)
    if command in allitems:
        sql = "SELECT item.description \
                FROM item \
                WHERE item.name  = %s" % command[-1]
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)
    else:
        print("There's no such item around! ")

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
