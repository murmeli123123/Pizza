import mysql.connector

db = mysql.connector.connect(host = "localhost",
                              user = "dbuser",
                              passwd = "salasana",
                              db = "pizzaDB",
                              buffered = True)
cursor = db.cursor()

def getPlayerLoc():
    sql = "SELECT player.placeID \
            FROM player"

    cursor.execute(sql)
    result = cursor.fetchall()
    for x in result:
        return(x[0])

def movePlayer(destination):
    sql = "SELECT movingtable.direction, movingtable.whereto \
	       FROM movingtable	WHERE movingtable.placeID = %i" % getPlayerLoc()
    cursor.execute(sql)
    result = cursor.fetchall()
    goto = 0
    for x in result:
        if destination == x[0]:
            goto = x[1]
    if goto != 0:
        sql = "UPDATE player SET placeID = %i WHERE player.playerID = 1" % goto
        cursor.execute(sql)
        print("You are now at ID: " + str(getPlayerLoc()))
    else:
        print("You can't go that way")
