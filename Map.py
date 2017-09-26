import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

# Kartan malli
def mapbase():
    base = list(" _______\n|\t|\n|\t|\n|_______|")
    return base

# Ilmansuunnat Minne pelaaja voi mennä olemastaan ruudusta
def moving():
    sql = "SELECT movingTable.direction \
            FROM player, place, movingTable \
            WHERE player.placeID = place.placeID \
            AND place.placeID = movingTable.placeID"
    cursor.execute(sql)
    move = cursor.fetchall()
    movements = str(move)
    return movements

# Kartta siitä ruudusta missä pelaaja on
def currentmap():
    base = mapbase()
    movements = moving()
    for x in movements:
        if x == "N":
            base[4] = "N"
        elif x == "W":
            base[13] = "W"
        elif x == "E":
            base[15] = "E"
        elif x == "S":
            base[21] = "S"
    for x in base:
        print(x, end='')
    print('\n')


command = ''
while command != 'stop':
    command = input("What to do next: ").split(' ')
    if command[0].upper() == 'MAP' or "M":
        currentmap()
